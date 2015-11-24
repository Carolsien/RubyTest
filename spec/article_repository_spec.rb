require 'simplecov'
SimpleCov.start
require_relative "../lib/article"
require_relative "../lib/article_helper"
require_relative "../lib/article_repository"
require "json"


describe ArticleRepository do
  let(:article1) {
      Article.new(id: 0,title: "omg0",content: "omg0", author:"asd", date: "12-20-2014")
  }

  let(:articles) do
    [
      article1,
      Article.new(id: 1,title: "omg",content: "omg", author:"asd", date: "11-20-2014")
    ]
  end

  let(:file) do
    {
      articles: articles
    }.to_json
  end

  describe ".find_by_id" do
    let(:article_repository) {described_class.new}
    before do
      allow(File).to receive(:read).and_return(file)
      article_repository.parsed_articles = articles
    end
    it "returns article" do
      expect(article_repository.find_by_id(0)).to be_a_kind_of(Article)
    end

    it "returs correct article" do
      article = article_repository.find_by_id(0)
      expect(article.id).to eq(article1.id)
      expect(article.title).to eq(article1.title)
      expect(article.content).to eq(article1.content)
      expect(article.author).to eq(article1.author)
      expect(article.date).to eq(article1.date)
    end

    it "returns false when there is no article" do
      expect(article_repository.find_by_id(10)).to eq(false)
    end
  end

  describe ".find_by_author" do
    let(:article_repository) {described_class.new}
    before do
      allow(File).to receive(:read).and_return(file)
      article_repository.parsed_articles = articles
    end
    it "returns array of articles" do
      expect(article_repository.find_by_author("asd")).to be_a_kind_of(Array)
    end

    it "returns all authors articles " do
      expect(article_repository.find_by_author("asd").size).to eq(2)
    end

    it "returs correct article" do
      article = article_repository.find_by_author("asd").first
      expect(article.id).to eq(article1.id)
      expect(article.title).to eq(article1.title)
      expect(article.content).to eq(article1.content)
      expect(article.author).to eq(article1.author)
      expect(article.date).to eq(article1.date)
    end

    it "returns empty array when there are no articles" do
      expect(article_repository.find_by_author("ooop").size).to eq(0)
    end
  end

  describe ".delete" do
    
  end

  describe ".save" do

  end
end
