class UserPresenter
  include ActionView::Helpers
  attr_accessor :user

  def initialize(user = nil)
    @user = user
  end

  #returned {"сент."=>{56=>"USD", 23=>"EURO"}, "окт."=>{467=>"USD"}, "нояб."=>{23=>"RUB"}}
  def dashboard_incomes(from: (Date.current.beginning_of_month - 3.month), to: Date.current.at_end_of_month)
    group_amount(Income.grouped_by_month(user, {from: from, to: to}).all)
  end

  def dashboard_outcomes(from: (Date.current.beginning_of_month - 3.month), to: Date.current.at_end_of_month)
    group_amount(Outcome.grouped_by_month(user, {from: from, to: to}).all)
  end

  def dashboard_loans(limit = 5)
    @user.loans.limit(limit).decorate
  end

  def dashboard_wishes(limit = 5)
    @user.wishes.limit(limit).decorate
  end

  private

  def group_amount(rows)
    stats = {}
    Rails.logger.debug(rows.inspect)

    rows.each do |row|
      month = I18n.t("date.abbr_month_names")[row['date']]
      currency = Currency.cached_currency(row['currency_id']).name
      stats[month] ||= {}
      stats[month][row['amount']] = currency
    end

    stats
  end
end