class LoanDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  def issue_date
    decorate_date(object.issue_date)
  end

  def rate
    "#{object.rate}%"
  end

  def category
    h.t(loan.category, scope: 'activerecord.attributes.loan.categories')
  end

end
