require "spec_helper"

describe Reckless::ResultsParser do
  describe "#parse" do
    let(:parser)  { described_class.new(body) }
    let(:body)    { fixture("page_with_results.html") }
    let(:results) { parser.parse }

    it "returns an array of results" do
      expect(results).to be_an Array
    end

    it "returns result hashes" do
      expect(results.all? { |r| r.kind_of?(Hash) }).to be_true
    end

    it "returns 30 results per page" do
      expect(results.size).to eq 30
    end

    describe "record" do
      let(:body)   { fixture("single_result.html") }
      let(:record) { results.first }

      it "includes artist name" do
        expect(record[:artist]).to eq "10,000 Maniacs"
      end

      it "includes record title" do
        expect(record[:title]).to eq "In My Tribe"
      end

      it "includes label name" do
        expect(record[:label]).to eq "Elektra"
      end

      it "includes price" do
        expect(record[:price]).to eq 4.99
      end

      it "includes type" do
        expect(record[:type]).to eq "Used LP"
      end

      it "includes condition" do
        expect(record[:condition]).to eq "Very Good"
      end

      it "includes location name" do
        expect(record[:location]).to eq "Broadway and Milwaukee Ave."
      end

      it "behaves like an object" do
        methods = %w(artist title label price type condition location).map(&:to_sym)

        methods.each do |name|
          expect(record.send(name)).to eq record[name]
        end
      end
    end
  end
end