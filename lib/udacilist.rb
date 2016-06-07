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
      else
        raise UdaciListErrors::InvalidItemType, "Type '#{type}' is unsupported"
    end
  end

  def delete(index)
    raise UdaciListErrors::IndexExceedsListSize, "Element at index #{index} doesn't exist" if @items.delete_at(index - 1).nil?
  end

  def all
    rows = []

    @items.each_with_index do |item, position|
      rows << ["#{position + 1}", "#{item.title}", "#{item.details}", "#{item.format_priority(item.priority)}"]
    end

    puts Terminal::Table.new :title => @title, :headings => %w(# Title Description Priority), :rows => rows
  end
end
