require_relative 'base_item'
require_relative 'dateable'

class TodoItem < BaseItem
  include Listable
  include Dateable
  attr_reader :due

  def initialize(title, options={})
    super title, options[:priority]

    @due = options[:due] ? date_parse(options[:due]) : options[:due]
  end

  def details
    'due: ' + format_date('No due date', @due)
  end
end
