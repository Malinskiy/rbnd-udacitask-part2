require_relative 'base_item'
require_relative 'dateable'

class SleepItem < BaseItem
  include Listable
  include Dateable
  attr_reader :start_date, :end_date

  def initialize(title, options={})
    super title, options[:priority]

    @start_date = date_parse(options[:start_date]) if options[:start_date]
    @end_date   = date_parse(options[:end_date]) if options[:end_date]
  end

  def details
    'take a nap: ' + format_date('N/A', @start_date, @end_date)
  end

  def type
    'sleep'
  end
end
