require_relative 'get_weather.rb'

CLOUDNESS = {0 => 'Ясно', 1 => 'Малооблачно', 2 => 'Облачно', 3 => 'Пасмурно'}
goroda = ["Москва","Кишинев","Тирасполь","Унгены","Бельцы","Пермь","Орел","Новосибирск"]
kod_goroda = {1=>37, 2=>300, 3=>324, 4=>17075, 5=>12195, 6=>59, 7=>115, 8=>99}

puts "Погоду для какого города Вы хотите узнать?"
n=1
while n <= goroda.size
  puts "#{n} : #{goroda[n-1]}"
  n+=1
end

answer = STDIN.gets.to_i


Forecast.new(kod_goroda[answer]).city_name
Forecast.new(kod_goroda[answer]).get_weather


