module Reckless
  class Search
    attr_reader :url, :params
    attr_reader :page, :total_results, :total_pages
    attr_reader :results

    def initialize(url, params = {})
      @url           = url
      @params        = params
      @page          = params[:page] || 1
      @total_results = 0
      @total_pages   = 0
      @results       = []

      fetch_page_contents
      parse_results_count
      parse_pagination
      parse_results
    end

    private

    def fetch_page_contents
      @body = Faraday.get(@url, @params).body
    end

    def parse_results_count
      matches = @body.scan(/<b>([\d]+) found.<\/b>/).flatten

      unless matches.empty?
        @total_results = matches.first.to_i
      end
    end

    def parse_pagination
      matches = @body.scan(/This is page ([\d]+) of ([\d]+)/).flatten

      unless matches.empty?
        @page        = matches[0].to_i
        @total_pages = matches[1].to_i
      end
    end

    def parse_results
      @results = Reckless::ResultsParser.new(@body).parse
    end
  end
end