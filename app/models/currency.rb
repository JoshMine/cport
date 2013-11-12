class Currency < ActiveRecord::Base
  attr_accessible :name, :symbol, :enabled

  validates :name, presence: true
  validates :symbol, presence: true

end
