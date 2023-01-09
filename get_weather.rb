require "net/http"
require "uri"
require "rexml/document"

class Forecast
  def initialize(city_code)
    uri = URI.parse("https://xml.meteoservice.ru/export/gismeteo/point/#{city_code}.xml")
    response = Net::HTTP.get_response(uri)
    @doc = REXML::Document.new(response.body)
    time = Time.now
  end


  def city_name
    city_name = URI.unescape(@doc.root.elements['REPORT/TOWN'].attributes['sname'])
    puts city_name
    puts
  end

  def get_weather
    n=0
    while n<4
      forecast = @doc.root.elements['REPORT/TOWN'].elements.to_a[n]
      min_temp = forecast.elements['TEMPERATURE'].attributes['min']
      max_temp = forecast.elements['TEMPERATURE'].attributes['max']

      max_wind = forecast.elements['WIND'].attributes['max']

      clouds_index = forecast.elements['PHENOMENA'].attributes['cloudness'].to_i
      clouds = CLOUDNESS[clouds_index]


      puts "#{forecast['day']}.#{forecast['month']}.#{forecast['year']} #{forecast['hour']}:00"
      puts "Температура : от  #{min_temp} до #{max_temp}"
      puts "Ветер до #{max_wind} м/с"
      puts clouds
      puts
      n+=1
    end

  end
end
