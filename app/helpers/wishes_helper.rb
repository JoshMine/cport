module WishesHelper

  def wish_column(column = '')
    Wish.human_attribute_name(column)
  end

end
