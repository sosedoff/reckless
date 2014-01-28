module Reckless
  class Crawler
    BASE_URL = "http://www.reckless.com"

    def recent_arrivals(days = 1)
      url = "#{BASE_URL}/new_arrivals.php"

      params = {
        store: "",
        format: "LP",
        style: "0",
        period: days,
      }

      # Get number of available pages
      pages = fetch_pages_count(url, params)

      # Fetch all results from all pages
      (1..pages).map do |page|
        results = fetch_results(url, params.merge(page: page))

        yield(page, results) if block_given?

        results
      end
    end

    private

    def fetch_page(url, params)
      Faraday.get(url, params).body
    end

    def fetch_results(url, params)
      Reckless::ResultsParser.new(fetch_page(url, params)).parse
    end

    def fetch_pages_count(url, params)
      result = fetch_page(url, params)
      result.scan(/This is page [\d]+ of ([\d]+)/).flatten.first.to_i
    end
  end
end