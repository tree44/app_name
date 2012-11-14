class System < ActiveRecord::Base
  attr_accessible :contact, :dbVersion, :description, :hardwareVersion, :location, :name, :serialNumber, :softwareVersion
end
