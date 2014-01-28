require "spec_helper"

describe Reckless::Client do
  let(:client) { described_class.new }

  describe "#search" do
    let(:result) { client.search }

    before do
      Faraday.stub_chain(:get, :body) { fixture("page_with_results.html") }
    end

    it "returns a search result" do
      expect(result).to be_a Reckless::Search
    end

    it "includes default search params" do
      defaults = {
        keywords: "",
        format: "LP",
        cond: "",
        store: "",
        page: 1,
        is_search: true
      }

      expect(result.params).to eq defaults
    end
  end

  describe "#recent_arrivals" do
    let(:result) { client.recent_arrivals }

    before do
      Faraday.stub_chain(:get, :body) { fixture("recent_arrivals.html") }
    end

    it "returns a search result" do
      expect(result).to be_a Reckless::Search
    end

    it "includes default search params" do
      defaults = {
        page: 1,
        period: 1,
        format: "LP",
        cond: "",
        store: "",
        style: 0
      }

      expect(result.params).to eq defaults
    end
  end
end