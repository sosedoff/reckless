require "spec_helper"

class NormalizerTest
  include Reckless::Normalizer
end

describe Reckless::Normalizer do
  let(:normalizer) { NormalizerTest.new }

  describe "#normalize_text" do
    let(:examples) do
      {
        "ALL CAPS TEXT"        => "All Caps Text",
        "all low text"         => "All Low Text",
        "13TH FLOOR ELEVATORS" => "13th Floor Elevators"
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
        "Beck, Jeff"                               => "Jeff Beck",
        "Beck,Jeff"                                => "Jeff Beck",
        "Astatke, Mulatu & Band"                   => "Mulatu Astatke & Band",
        "10,000 Maniacs"                           => "10,000 Maniacs",
        "Allman Brothers Band, The"                => "The Allman Brothers Band",
        "Grateful Dead, The"                       => "The Grateful Dead",
        "Grateful Dead, The (Robert Hunter)"       => "The Grateful Dead (Robert Hunter)",
        "HUMPHREY, PAUL (& THE COOL AID CHEMISTS)" => "PAUL HUMPHREY (& THE COOL AID CHEMISTS)",
        "Turner, Ike & Tina"                       => "Ike & Tina Turner"
      }
    end

    it "converts weird artist name into correct form" do
      examples.each_pair do |before, after|
        expect(normalizer.normalize_artist(before)).to eq after
      end
    end
  end
end