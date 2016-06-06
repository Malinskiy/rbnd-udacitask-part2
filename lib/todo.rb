require_relative 'base_item'
require_relative 'dateable'

class TodoItem < BaseItem
  include Listable
  include Dateable
  attr_reader :due

  def initialize(description, options={})
    super description, options[:priority]

    @due = options[:due] ? date_parse(options[:due]) : options[:due]
  end

  def details
    format_description(@description) + 'due: ' +
        format_date('No due date', @due) +
        format_priority(@priority)
  end
end
