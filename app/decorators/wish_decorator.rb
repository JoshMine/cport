class WishDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def final_date
    decorate_date(object.final_date)
  end

  def amount_currency
    "#{object.amount} #{object.currency.name}"
  end

  def need_amount_currency
    "#{object.need_amount} #{object.currency.name}"
  end

end