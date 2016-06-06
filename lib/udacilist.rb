require_relative 'errors'

class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title]
    @items = []
  end

  def add(type, description, options={})
    type = type.downcase

    case type
      when 'todo'
        @items.push TodoItem.new(description, options)
      when 'event'
        @items.push EventItem.new(description, options)
      when 'link'
        @items.push LinkItem.new(description, options)
      else
        raise UdaciListErrors::InvalidItemType, "Type '#{type}' is unsupported"
    end
  end

  def delete(index)
    raise UdaciListErrors::IndexExceedsListSize, "Element at index #{index} doesn't exist" if @items.delete_at(index - 1).nil?
  end

  def all
    puts '-' * @title.length
    puts @title
    puts '-' * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end
end
