require "./article.rb"
require "./user.rb"
require "./user_helper.rb"
require "./authenticator.rb"
require "./user_repository.rb"
require "./article_repository.rb"
require "json"
require "pry"

binding.pry
current_user = nil
until current_user.class == User
  puts "Podaj login: "
  login = $stdin.gets.chomp
  puts "Podaj hasło: "
  password = $stdin.gets.chomp
  current_user = Authenticator.auth(login, password)
end

puts "Zalogowano"
