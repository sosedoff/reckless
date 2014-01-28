require "spec_helper"

class NormalizerTest
  include Reckless::Normalizer
end

describe Reckless::Normalizer do
  let(:normalizer) { NormalizerTest.new }

  describe "#normalize_text" do
    let(:examples) do
      {
        "ALL CAPS TEXT" => "All Caps Text",
        "all low text"  => "All Low Text"
      }
    end

    it "convert text into capitalized words" do
      examples.each_pair do |before, after|
        expect(normalizer.normalize_text(before)).to eq after
      end
    end
  end

  describe "#normalize_artist" do
    let(:examples) do
      {
        "Beck, Jeff"             => "Jeff Beck",
        "Beck,Jeff"              => "Jeff Beck",
        "Astatke, Mulatu & Band" => "Mulatu Astatke & Band",
        "10,000 Maniacs"         => "10,000 Maniacs"
      }
    end

    it "converts weird artist name into correct form" do
      examples.each_pair do |before, after|
        expect(normalizer.normalize_artist(before)).to eq after
      end
    end
  end
end