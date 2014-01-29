module Reckless
  class Client
    BASE_URL = "http://www.reckless.com"

    def search(keywords = "", options = {})
      url = "#{BASE_URL}/index.php"

      params = search_options(options).merge(
        keywords: keywords,
        is_search: true
      )

      Reckless::Search.new(url, params)
    end

    def recent_arrivals(options = {})
      url = "#{BASE_URL}/new_arrivals.php"

      params = search_options(options).merge(
        period: options[:period] || 1,
        style:  options[:style]  || 0
      )

      Reckless::Search.new(url, params)
    end

    private

    def search_options(options)
      {
        page:   options[:page]     || 1,
        format: options[:format]   || "LP",
        cond:   options[:cond]     || "",
        store:  options[:location] || ""
      }
    end
  end
end