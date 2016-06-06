module Listable
  def format_description(description)
    "#{description}".ljust(30)
  end

  def format_date(fallback, *dates)
    dates.map { |date| date.nil? ? fallback : date.strftime('%D') }.join(' -- ')
  end
end
