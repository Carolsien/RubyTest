require "./article.rb"
require "./user.rb"
require "./user_helper.rb"
require "./article_helper.rb"
require "./authenticator.rb"
require "./user_repository.rb"
require "./article_repository.rb"
require "json"
require "pry"

def add_article
  puts "Podaj tytuł: "
  tytul = $stdin.gets.chomp
  puts "Podaj treść: "
  tresc = $stdin.gets.chomp
  artykul = Article.new(title: tytul, content: tresc, author: $current_user.login)
  ArticleRepository.new.save(artykul)
  puts "Artykuł dodany"
end

def show_article
  articles = ArticleRepository.new.all
  articles.each do |article|
    puts "id: #{article.id}, tytuł: #{article.title}"
  end
end

def delete_article
  article_ids = ArticleRepository.new.all.map(&:id)
  puts "Ktory artykuł chcesz usunąć?"
  puts article_ids
  usun = $stdin.gets.chomp.to_i
  artykul = ArticleRepository.new.find_by_id(usun)
  ArticleRepository.new.delete(artykul)
  puts "Artykuł usunięto"
end

def find_by_id
  article_ids = ArticleRepository.new.all.map(&:id)
  puts article_ids
  puts "Ktory artykuł chcesz zobaczyc?"
  znajdz = $stdin.gets.chomp.to_i
  artykul = ArticleRepository.new.find_by_id(znajdz)
  if artykul
    puts "id: #{artykul.id}, tytuł: #{artykul.title}, tresc: #{artykul.content}, autor: #{artykul.author}, data: #{artykul.date}"
  else
    puts "nie ma takiego artykułu"
  end
end

def find_by_author
  autorzy = UserRepository.new.all.map(&:login)
  puts autorzy
  puts "Czyje artykuły chcesz zobaczyć?"
  autor = $stdin.gets.chomp
  artykuly = ArticleRepository.new.find_by_author(autor)
  if artykuly.empty?
    puts "Autor nie ma artykułow"
  else
    artykuly.each do |artykul|
      puts "id: #{artykul.id}, tytuł: #{artykul.title}, tresc: #{artykul.content}, autor: #{artykul.author}, data: #{artykul.date}"
    end
  end
end

def menu
  puts "1. Dodaj artykuł"
  puts "2. Pokaż artykuły"
  puts "3. Usuń artykuł"
  puts "4. Wyszukaj po autorze"
  puts "5. Wyszukaj po indeksie"
  puts "6. Wyjdź."
end

$current_user = nil
until $current_user.class == User
  puts "Podaj login: "
  login = $stdin.gets.chomp
  puts "Podaj hasło: "
  password = $stdin.gets.chomp
  $current_user = Authenticator.auth(login, password)
end

puts "Zalogowano"
menu
wybor = nil
until wybor == 6
  wybor = $stdin.gets.chomp.to_i
  case wybor
  when 1
    add_article
  when 2
    show_article
  when 3
    delete_article
  when 4
    find_by_author
  when 5
    find_by_id
end
end
