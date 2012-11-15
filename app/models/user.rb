# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  self.include_root_in_json = true
  has_secure_password
  has_many :microposts

  validates :name, presence: true, length: { maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
# Using validates :uniqueness does not guarantee uniqueness.
#accidentally clicks on “Submit” twice, sending two requests in quick succession.
#The following sequence occurs: request 1 creates a user in memory that passes validation, 
#request 2 does the same, request 1’s user gets saved, request 2’s user gets saved.
#Result: two user records with the exact same email address, despite the uniqueness validation.
#
#MUST enforce uniqueness at the database level, crete an index on email column
#see db/migrate/xxx_add-index_to_users_email.rb

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
