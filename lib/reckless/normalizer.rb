module Reckless
  module Normalizer
    #
    # Transform text from all caps to normal capitalized words
    # Example: SOME GREAT BAND => Some Great Band
    #
    def normalize_text(text)
      text.downcase.split.map(&:capitalize).join(" ")
    end

    #
    # Transform artist name to normal representation
    # Example: Beck, Jeff => Jeff Beck
    #
    def normalize_artist(text)
      if text =~ /[\d]+,[\d]+/
        text
      else
        text.gsub(/(([\w\s]+),\s?([\w]+))/) do |m|
          m = "#{$3} #{$2}"
        end
      end
    end
  end
end