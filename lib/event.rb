require_relative 'base_item'

class EventItem < BaseItem
  include Listable
  attr_reader :start_date, :end_date

  def initialize(description, options={})
    super description, options[:priority]

    @start_date = Date.parse(options[:start_date]) if options[:start_date]
    @end_date   = Date.parse(options[:end_date]) if options[:end_date]
  end

  def details
    format_description(@description) + 'event dates: ' + format_date('N/A', @start_date, @end_date)
  end
end
