require 'simplecov'
SimpleCov.start
require_relative "../lib/article"
require_relative "../lib/article_helper"
require_relative "../lib/article_repository"
require "json"


describe Article do
  describe ".to_json" do
    let (:article) {Article.new(id: 1,title: "omg",content: "omg", author:"asd", date: "11-20-2014")}
    it "returns json string" do
      expect(article.to_json).to be_a_kind_of(String)
    end

    it "properly serializes user" do
      expect(JSON.parse(article.to_json)["id"]).to eq(1)
      expect(JSON.parse(article.to_json)["title"]).to eq("omg")
      expect(JSON.parse(article.to_json)["content"]).to eq("omg")
      expect(JSON.parse(article.to_json)["author"]).to eq("asd")
      expect(JSON.parse(article.to_json)["date"]).to eq("11-20-2014")
    end
  end
end
