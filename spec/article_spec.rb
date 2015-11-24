require 'simplecov'
SimpleCov.start
require_relative "../lib/article"
require_relative "../lib/article_helper"
require_relative "../lib/article_repository"
require "json"


describe Article do


    describe ".new" do
      let (:article) {Article.new(id: 1,title: "omg",content: "omg", author:"asd", date: "11-20-2014")}
      before do
        allow_any_instance_of(ArticleHelper).to receive(:get_id).and_return(0)
      end
      it "returns instance of article class" do
        expect(Article.new(id: 1,title: "omg",content: "omg", author:"asd", date: "11-20-2014")).to be_a_kind_of(Article)
      end

      it "initializes properly" do
        expect(article.id).to eq(1)
        expect(article.title).to eq("omg")
        expect(article.content).to eq("omg")
        expect(article.author).to eq("asd")
        expect(article.date).to eq("11-20-2014")
      end

      context "id not given" do
        before do
          allow(ArticleHelper).to receive(:get_id).and_return(0)
        end
        it "sets id dynamically if not given in params" do
          article1 = Article.new(title: "omg",content: "omg", author:"asd", date: "11-20-2014")
          expect(article1.id).to eq(0)
        end
      end
    end


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
