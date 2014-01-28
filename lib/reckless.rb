require "nokogiri"
require "faraday"

require "reckless/client"
require "reckless/search"
require "reckless/results_parser"
require "reckless/version"

module Reckless
  def self.search(keywords = nil, options = nil)
    Reckless::Client.new.search(keywords, options)
  end
end