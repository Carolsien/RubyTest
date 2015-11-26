class Article
  attr_accessor :id, :title, :author, :content, :date

  def initialize(id: nil, date: nil, title:, content:, author:)
    @id = id
    @id = ArticleHelper.get_id if id.nil?
    @title = title
    @content = content
    @author = author
    @date = date
    @date = Time.new if date.nil?
  end

  def to_json(options = {})
    u = {
      id: id,
      title: title,
      content: content,
      author: author,
      date: date
    }
    JSON.pretty_generate(u, options)
  end
end
