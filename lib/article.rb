class Article
  attr_accessor :title, :author, :content, :date

  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
    @date = Date.new    
  end
end
