class ArticleRepository
  def all
    parsed_articles
  end

  def find_by_id(id)
    all_articles = ArticleRepository.new.all
    all_articles.each do |article|
      if article.id == id
        return article
      end
    end
    false
  end

  def save(article)
    articles = parsed_articles
    articles << article
    save_articles(articles)
  end

  def delete(article)
    all_articles = parsed_articles
    articles = []
    all_articles.each do |a|
      unless a.id == article.id
        articles << a
      end
    end
    save_articles(articles)
  end

  def find_by_author(author)
      all_articles = ArticleRepository.new.all
      articles = []
      all_articles.each do |article|
        if article.author == author
          articles << article
        end
      end
      articles
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
    articles_json = {
      articles: articles
    }.to_json
    File.open("articles.json", 'w') do |f|
      f.write articles_json
    end
  end
end
