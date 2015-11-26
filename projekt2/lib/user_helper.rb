class UserHelper
  def self.get_id
    UserRepository.new.all.last.id + 1
  end
end
