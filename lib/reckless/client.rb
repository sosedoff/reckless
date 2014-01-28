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
  end
end