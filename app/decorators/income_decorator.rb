class IncomeDecorator < ApplicationDecorator
  delegate_all
  decorates_finders

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  def date_in
    decorate_date(object.date_in)
  end

  def income_type
    h.t(income.income_type, scope: 'activerecord.attributes.income.types')
  end
end
