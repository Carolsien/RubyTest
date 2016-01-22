class Authenticator
  def self.auth(login, password)
    users = UserRepository.new.all
    users.each do |user|
      if user.login == login && user.password == password
        return user
      end
    end
    false
  end
end
