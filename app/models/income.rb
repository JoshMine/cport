class Income < ActiveRecord::Base
  TYPE = ['mine_job', 'other_job', 'other_income', 'estate_leasing']

  belongs_to :user
  belongs_to :currency

  attr_accessible :amount, :currency_id, :date_in, :income_type

  validates_associated :user, :currency

  validates :amount, presence: true, numericality: true
  validates :date_in, presence: true
  validates :income_type, presence: true, inclusion: {in: Income::TYPE}

  #date_in stats month
  #returned object [{date_in: 9, amount: 79, currency_id: 1}]
  def self.grouped_by_month(user, args = {})
    where(user_id: user.id).where("date_in >= ? AND date_in <= ?", args[:from], args[:to])
    .group('MONTH(date_in)').group('currency_id')
    .select("SUM(amount) AS amount, MONTH(date_in) AS date, currency_id AS currency_id")
  end

end
