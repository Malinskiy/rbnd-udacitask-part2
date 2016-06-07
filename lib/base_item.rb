require_relative 'errors'

class BaseItem
  attr_reader :title, :description, :priority

  def initialize(title, priority)
    if ![nil, 'low', 'medium', 'high'].include? priority
      raise UdaciListErrors::InvalidPriorityValue, "Priority '#{priority}' is invalid"
    end

    @title    = title
    @priority = priority
  end
end