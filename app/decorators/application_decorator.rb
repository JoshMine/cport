class ApplicationDecorator < Draper::Decorator

  def decorate_date(date)
    helpers.content_tag :span, class: 'time' do
      l(date, format: "%d %b %Y")
    end
  end

  def self.collection_decorator_class
    PaginatingDecorator
  end

end