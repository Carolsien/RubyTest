class User
  attr_accessor :id, :login, :password

  def initialize(id = nil, login, password)
    @id = id
    @id = UserHelper.get_id if id.nil?
    @login = login
    @password = password
  end
end
