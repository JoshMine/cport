class Outcome < ActiveRecord::Base
  TYPE = ['food', 'goods', 'education', 'estate_leasing']

  belongs_to :user
  belongs_to :currency

  attr_accessible :amount, :date_out, :currency_id, :outcome_type, :required

  validates_associated :user, :currency
  validates :amount, presence: true, numericality: true
  validates :date_out, presence: true
  validates :outcome_type, presence: true, inclusion: {in: Outcome::TYPE}


  #date_out stats month
  #returned object [{date_out: 9, amount: 79, currency_id: 1}]
  def self.grouped_by_month(user, args = {})
    where(user_id: user.id).where("date_out >= ? AND date_out <= ?", args[:from], args[:to])
    .group('MONTH(date_out)').group('currency_id')
    .select("SUM(amount) AS amount, MONTH(date_out) AS date, currency_id AS currency_id")
  end

end
