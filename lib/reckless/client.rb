module Reckless
  class Client
    BASE_URL = "http://www.reckless.com"

    def search(keywords = "", options = {})
      url = "#{BASE_URL}/index.php"

      params = {
        keywords:  keywords,
        format:    options[:format] || "LP",
        cond:      options[:cond]   || "",
        store:     options[:store]  || "",
        page:      options[:page]   || 1,
        is_search: true
      }

      Reckless::Search.new(url, params)
    end

    def recent_arrivals(options = {})
      url = "#{BASE_URL}/new_arrivals.php"

      params = {
        page:   options[:page]   || 1,
        period: options[:period] || 1,
        format: options[:format] || "LP",
        cond:   options[:cond]   || "",
        store:  options[:store]  || "",
        style:  0
      }

      Reckless::Search.new(url, params)
    end
  end
end