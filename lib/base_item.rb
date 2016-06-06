require_relative 'errors'

class BaseItem
  attr_reader :description, :priority

  def initialize(description, priority)
    if ![nil, 'low', 'medium', 'high'].include? priority
      raise UdaciListErrors::InvalidPriorityValue, "Priority '#{priority}' is invalid"
    end

    @description = description
    @priority    = priority
  end
end