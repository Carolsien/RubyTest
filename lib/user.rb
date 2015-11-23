require "json"

class User
  attr_accessor :id, :login, :password

  def initialize(id: nil, login:, password:)
    @id = id
    @id = UserHelper.get_id if id.nil?
    @login = login
    @password = password
  end

  def to_json(options = {})
    u = {
      id: id,
      login: login,
      password: password
    }
    JSON.pretty_generate(u, options)
  end
end
