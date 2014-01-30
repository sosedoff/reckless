require "spec_helper"

describe Reckless::Search do
  let(:search) { described_class.new("http://example.com") }

  describe "#initialize" do
    before do
      Faraday.stub_chain(:get, :body) { "" }
    end

    it "assigns url" do
      expect(search.url).to eq "http://example.com"
    end

    it "assigns params" do
      expect(search.params).to be_a Hash
      expect(search.params).to be_empty
    end

    it "assigns page" do
      expect(search.page).to eq 1
    end

    it "assigns total results count" do
      expect(search.total_results).to eq 0
    end

    it "assigns total pages count" do
      expect(search.total_pages).to eq 0
    end

    it "assigns results collection" do
      expect(search.results).to eq []
    end
  end

  describe "for results page" do
    let(:page) { fixture("page_with_results.html") }

    before do
      Faraday.stub_chain(:get, :body) { page }
    end

    it "assigns total results count" do
      expect(search.total_results).to eq 33515
    end

    it "assigns total pages count" do
      expect(search.total_pages).to eq 1118
    end

    it "assigns current page" do
      expect(search.page).to eq 1
    end

    it "assigns results" do
      expect(search.results).to be_an Array
      expect(search.results.size).to eq 30
    end
  end

  describe "for no results" do
    let(:page) { fixture("no_results.html") }

    before do
      Faraday.stub_chain(:get, :body) { page }
    end

    it "assigns total results count" do
      expect(search.total_results).to eq 0
    end

    it "assigns total pages count" do
      expect(search.total_pages).to eq 0
    end

    it "assigns results" do
      expect(search.results).to eq []
    end
  end

  describe "for page without pagination" do
    let(:page) { fixture("no_pagination.html") }

    before do
      Faraday.stub_chain(:get, :body) { page }
    end

    it "assigs total results count" do
      expect(search.total_results).to eq 4
    end

    it "assigns total pages count" do
      expect(search.total_pages).to eq 1
    end

    it "assings results" do
      expect(search.results.size).to eq 4
    end
  end
end