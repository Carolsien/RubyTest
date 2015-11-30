#pobranie wartosci n
  puts "Podaj liczbę naturalną n: "
  n = $stdin.gets.chomp.to_i
  if(n < 1)
    until n >= 1 do
      puts "Liczba n powinna byc większa lub rowna 1. Wprowadz poprawna wartosc."
      n = $stdin.gets.chomp.to_i
    end
  else
    puts "Wprowadzono liczbe n = #{n}"
  end

#pobranie przedzialu ab
  puts "Podaj liczbę naturalną a: "
  a = $stdin.gets.chomp.to_i
  puts "Podaj liczbę naturalną b: "
  b = $stdin.gets.chomp.to_i
  if(a > b || a == b)
    puts "Lewa wartosci (a) przedziału powinna byc wieksza niz prawa wartosc (b)"
    until a < b do
      puts "Podaj liczbę naturalną a: "
      a = $stdin.gets.chomp.to_i
      puts "Podaj liczbę naturalną b: "
      b = $stdin.gets.chomp.to_i
    end
  else
    puts "Wprowadzono przedzial [a,b] = #{[a,b]}"
  end

#pobranie wartosci yi
  puts "Podaj wartosci y: "
  y = []
  input = ' '
  while input != ''
    input = gets.chomp
    y.push input
  end
  if (y.length == 1 && y.length <= n)
    puts "Tablica nie moze byc pusta ani większa od liczby n"
    until (y.length != 1) do
      input = ' '
      while input != ''
        input = gets.chomp
        y.push input
      end
    end
    puts
    puts y
  else
    puts
    puts y
  end

#pobranie wartosci zi
  puts "Podaj wartosci z: "
  z = []
  input = ' '
  while input != ''
    input = gets.chomp
    z.push input
  end
  if (z.length == 1 && z.length <=n)
    puts "Tablica nie moze byc pusta"
    until (z.length != 1) do
      input = ' '
      while input != ''
        input = gets.chomp
        z.push input
      end
    end
    puts
    puts z
  else
    puts
    puts z
  end

#liczenie wezlow rownoodleglych
  x = []
  h1 = (b - a)
  h = h1/n
  x = a+(y.length-1)*h

  puts "h = #{h}"
  puts "x - #{x}"

#stopien k wielomianu H
  k = 2*n + 1
  puts "k = #{k}"
