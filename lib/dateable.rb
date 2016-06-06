require 'chronic'

module Dateable
  def date_parse(string)
    Chronic.parse(string)
  end
end