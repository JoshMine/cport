class Person < ActiveRecord::Base
  attr_accessible 
  
  belongs_to :portfolio
end
