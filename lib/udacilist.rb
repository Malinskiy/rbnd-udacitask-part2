require_relative 'errors'
require 'terminal-table'

class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title] ? options[:title] : 'Untitled List'
    @items = []
  end

  def add(type, title, options={})
    type = type.downcase

    case type
      when 'todo'
        @items.push TodoItem.new(title, options)
      when 'event'
        @items.push EventItem.new(title, options)
      when 'link'
        @items.push LinkItem.new(title, options)
      when 'sleep'
        @items.push SleepItem.new(title, options)
      else
        raise UdaciListErrors::InvalidItemType, "Type '#{type}' is unsupported"
    end
  end

  def delete(*index)
    index
        .sort { |x, y| y <=> x }
        .each { |idx|
      raise UdaciListErrors::IndexExceedsListSize, "Element at index #{idx} doesn't exist" if @items.delete_at(idx - 1).nil?
    }
  end

  def all
    print(@items)
  end

  def print(items)
    rows = []

    items.each_with_index do |item, position|
      rows << ["#{position + 1}", "#{item.title}", "#{item.type}", "#{item.details}", "#{item.format_priority(item.priority)}"]
    end

    puts Terminal::Table.new :title => @title, :headings => %w(# Title Type Description Priority), :rows => rows
  end

  def filter(type)
    result = @items.select { |item| item.type == type }

    if result.empty?
      puts "No items of type '#{type}' in list"
    else
      print result
    end
  end
end
