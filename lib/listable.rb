module Listable
  def format_description(description)
    "#{description}".ljust(30)
  end

  def format_date(fallback, *dates)
    dates.map { |date| date.nil? ? fallback : date.strftime('%D') }.join(' -- ')
  end

  def format_priority(priority)
    case priority
      when 'high'
        value = ' ⇧'
      when 'medium'
        value = ' ⇨'
      when 'low'
        value = ' ⇩'
      else
        value = ''
    end
    return value
  end
end
