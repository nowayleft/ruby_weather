require 'httpclient'
require 'json'

class RubyWeather

  def initialize
    @base_uri = 'https://www.metaweather.com/api'
  end
  
  def get_from_city(city_name = nil)
    client   = HTTPClient.new
    response = JSON.parse(client.get_content("#{@base_uri}/location/search/?query=#{city_name}"))
    woeid    = response.first['woeid']
    response = JSON.parse(client.get_content("#{@base_uri}/location/#{woeid}"))
  end
  
end
