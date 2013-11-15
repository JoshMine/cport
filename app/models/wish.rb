class Wish < ActiveRecord::Base
  belongs_to :user
  belongs_to :currency

  attr_accessible :amount, :currency_id, :final_date, :name, :need_amount

  validates_associated :user, :currency

  validates :name, presence: true
  validates :amount, presence: true, numericality: true
  validates :need_amount, presence: true, numericality: true
  validates :final_date, presence: true

end
