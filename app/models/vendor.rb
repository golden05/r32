class Vendor < ActiveRecord::Base
  attr_accessible :address, :name, :nsh
  validates :name, presence: true
end
