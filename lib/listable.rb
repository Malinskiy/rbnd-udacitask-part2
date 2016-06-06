require 'colorize'

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
        value = ' ⇧'.colorize(:red)
      when 'medium'
        value = ' ⇨'.colorize(:yellow)
      when 'low'
        value = ' ⇩'.colorize(:green)
      else
        value = ''
    end
    return value
  end
end
