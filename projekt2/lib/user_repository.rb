class UserRepository
  attr_accessor :parsed_users

  def all
    parsed_users
  end

  private

  def parsed_users
    f = File.read("users.json")
    p = JSON.parse(f)
    @parsed_users = p["users"].each_with_object([]) do |user, users|
      users << User.new(id: user["id"], login: user["login"], password: user["password"])
    end
  end
end
