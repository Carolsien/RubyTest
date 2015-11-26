class ArticleHelper
  def self.get_id
    ArticleRepository.new.all.last.id + 1
  end
end
