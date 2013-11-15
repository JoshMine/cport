class Currency < ActiveRecord::Base
  attr_accessible :name, :symbol, :enabled

  validates :name, presence: true
  validates :symbol, presence: true

  def self.cached_currency(id)
    Rails.cache.fetch([name, id]) { find(id) }
  end

end
