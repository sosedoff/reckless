require "nokogiri"
require "faraday"
require "hashr"

require "reckless/client"
require "reckless/search"
require "reckless/normalizer"
require "reckless/results_parser"
require "reckless/version"

module Reckless
  def self.search(keywords = "", options = {})
    Reckless::Client.new.search(keywords, options)
  end

  def self.recent_arrivals(options = {})
    Reckless::Client.new.recent_arrivals(options)
  end

  def self.new_arrivals(options = {})
    Reckless::Client.new.recent_arrivals(options)
  end
end