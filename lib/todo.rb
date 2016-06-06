require_relative 'base_item'

class TodoItem < BaseItem
  include Listable
  attr_reader :due

  def initialize(description, options={})
    super description, options[:priority]

    @due = options[:due] ? Date.parse(options[:due]) : options[:due]
  end

  def details
    format_description(@description) + 'due: ' +
        format_date('No due date', @due) +
        format_priority(@priority)
  end
end
