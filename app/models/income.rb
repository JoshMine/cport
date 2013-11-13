class Income < ActiveRecord::Base
  TYPE = ['mine_job', 'other_job', 'other_income', 'estate_leasing']

  belongs_to :user
  belongs_to :currency

  attr_accessible :amount, :currency_id, :date_in, :income_type

  validates_associated :user, :currency

  validates :amount, presence: true, numericality: true
  validates :date_in, presence: true
  validates :income_type, presence: true, inclusion: {in: Income::TYPE}

end
