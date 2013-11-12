module ApplicationHelper

  def day_select_map
    1.upto(31).collect { |day| [day, day] }
  end
end
