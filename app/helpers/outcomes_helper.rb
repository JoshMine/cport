module OutcomesHelper

  def outcome_column(column = '')
    Outcome.human_attribute_name(column)
  end

  def outcome_type_select_map
    Outcome::TYPE.collect { |type| [t(type, scope: 'activerecord.attributes.outcome.types'), type] }
  end

end
