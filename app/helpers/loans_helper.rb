module LoansHelper

  def loan_column(column = '')
    Loan.human_attribute_name(column)
  end

  def loan_category_select_map
    Loan::CATEGORY.collect { |category| [t(category, scope: 'activerecord.attributes.loan.categories'), category] }
  end

  def loan_type_select_map
    Loan::TYPE.collect { |type| [t(type, scope: 'activerecord.attributes.loan.types'), type] }
  end

  def currency_select_map
    Currency.all.collect { |currency| [currency.name, currency.id] }
  end


end
