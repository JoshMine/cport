class OutcomeDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def date_out
    decorate_date(object.date_out)
  end

  def required
    h.t("global.#{object.required}")
  end

  def outcome_type
    h.t(outcome.outcome_type, scope: 'activerecord.attributes.outcome.types')
  end
end
