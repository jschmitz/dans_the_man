class Address < ActiveRecord::Base
  validates_presence_of :street_address
end
