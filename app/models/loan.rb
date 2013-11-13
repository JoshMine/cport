class Loan < ActiveRecord::Base
  CATEGORY = ['mortgage', 'car_loan', 'consumer_credit']
  TYPE = ['differentiated', 'annuity']

  belongs_to :user
  belongs_to :currency

  attr_accessible :amount, :category, :date_payment, :issue_date, :loan_type, :monthly_payment, :rate, :term, :currency_id

  validates_associated :user, :currency

  validates :amount, presence: true, numericality: true
  validates :category, presence: true, inclusion: {in: Loan::CATEGORY}
  validates :date_payment, presence: true, inclusion: {in: 1..30}
  validates :issue_date, presence: true
  validates :loan_type, presence: true, inclusion: {in: Loan::TYPE}
  validates :monthly_payment, presence: true, numericality: true
  validates :rate, presence: true, numericality: true # поценты
  validates :term, presence: true, numericality: true  #количество месяцев выплаты

end
