require "spec_helper"

describe Reckless do
  it { should respond_to :search }
  it { should respond_to :recent_arrivals }

  before do
    Faraday.stub_chain(:get, :body) { "" }
  end

  describe ".search" do
    it "returns a search result" do
      expect(described_class.search).to be_a Reckless::Search
    end
  end

  describe ".recent_arrivals" do
    it "returns a search result" do
      expect(described_class.recent_arrivals).to be_a Reckless::Search
    end
  end
end