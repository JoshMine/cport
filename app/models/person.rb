class Person < ActiveRecord::Base
  attr_accessible 
  
  belongs_to :portfolio
  has_one    :contact_data
  
end
