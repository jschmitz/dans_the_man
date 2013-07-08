class Guest < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :first_name
end
