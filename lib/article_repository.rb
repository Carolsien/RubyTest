class ArticleRepository
  def all
    parsed_articles
  end

  def find_by_id(id)
  end

  def save(article)
    articles = parsed_articles
    articles << article
    save_articles(articles)
  end

  def delete
  end

  def find_by_author(author)
  end

  private

  def parsed_articles
    f = File.read("articles.json")
    p = JSON.parse(f)
    p["articles"].each_with_object([]) do |article, articles|
      articles << Article.new(id: article["id"], date: article["date"], title: article["title"], content: article["content"], author: article["author"])
    end
  end

  def save_articles(articles)
    
  end
end
