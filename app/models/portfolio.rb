class Portfolio < ActiveRecord::Base
  attr_accessible :active
  
  belongs_to :user
  has_many :person
  
end
