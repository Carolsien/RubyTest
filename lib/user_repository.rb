class UserRepository
  def all
    parsed_users
  end

  def parsed_users
    f = File.read("users.json")
    p = JSON.parse(f)
    p["users"].each_with_object([]) do |user, users|
      users << User.new(user["id"], user["login"], user["password"])
    end
  end
end
