require_relative 'base_item'

class LinkItem < BaseItem
  include Listable
  attr_reader :site_name, :url

  def initialize(url, options={})
    super url, options[:priority]

    @url       = url
    @site_name = options[:site_name]
  end

  def format_name
    @site_name ? @site_name : ""
  end

  def type
    'link'
  end

  def details
    'site name: ' + format_name
  end
end
