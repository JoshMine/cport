module IncomesHelper

  def income_column(column = '')
    Income.human_attribute_name(column)
  end

  def income_type_select_map
    Income::TYPE.collect { |type| [t(type, scope: 'activerecord.attributes.income.types'), type] }
  end

end
