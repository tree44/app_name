class System < ActiveRecord::Base
  attr_accessible :contact, :dbVersion, :description, :hardwareVersion, :location, :name, :serialNumber, :softwareVersion
  self.include_root_in_json = true
end
