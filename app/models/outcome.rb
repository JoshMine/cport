class Outcome < ActiveRecord::Base
  TYPE = ['food', 'goods', 'education', 'estate_leasing']

  belongs_to :user
  belongs_to :currency

  attr_accessible :amount, :date_out, :currency_id, :outcome_type, :required

  validates_associated :user, :currency
  validates :amount, presence: true, numericality: true
  validates :date_out, presence: true
  validates :outcome_type, presence: true, inclusion: {in: Outcome::TYPE}

end
