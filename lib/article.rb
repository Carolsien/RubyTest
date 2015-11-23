class Article
  attr_accessor :id, :title, :author, :content, :date

  def initialize(id: nil, date: nil, title:, content:, author:)
    @id = id
    @id = ArticleHelper.get_id if id.nil?
    @title = title
    @content = content
    @author = author
    @date = date
    @date = Date.new if date.nil?
  end

  def to_json
    {
      id: id,
      title: title,
      content: content,
      author: author,
      date: date  
    }
  end
end
