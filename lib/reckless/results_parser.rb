module Reckless
  class ResultsParser
    include Reckless::Normalizer

    def initialize(body)
      @document = Nokogiri::HTML(body)
    end

    def parse
      find_result_elements.map { |node| Hashr.new(fetch_record(node)) }
    end

    private

    def find_result_elements
      @document.css("table.item")
    end

    def fetch_record(node)
      {
        artist:    normalize_artist(fetch_text(node, "artist")),
        title:     fetch_text(node, "title"),
        label:     fetch_text(node, "label"),
        price:     fetch_price(node.css("td").last),
        type:      fetch_type(node),
        condition: fetch_condition(node),
        location:  fetch_location_name(node)
      }
    end

    def fetch_price(node)
      node.to_s.scan(/\$([\d\.]+)/).flatten.first.to_f
    end

    def fetch_text(node, name)
      element = node.css("span.#{name}").first
      element ? normalize_text(element.children.first.text.strip) : ""
    end

    def fetch_type(node)
      element = node.css("tr:last-child td b").first

      if element
        text = element.children.first.text.strip
        text.scan(/^([\w]+ [\w]+)/).flatten.first
      end
    end

    def fetch_condition(node)
      element = node.css("tr:last-child td b").first

      if element
        text = element.children.first.text.gsub("Condition", "")
        text.scan(/\(([\w\s]+)\)/).flatten.first.to_s.strip
      end
    end

    def fetch_location_name(node)
      match = node.to_s.scan(/<span style="color:#a33; font-weight: bold;">([\w\s\.]+)<\/span>/)
      match.flatten.first
    end
  end
end