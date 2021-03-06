require 'net/http'
require 'uri'
require 'json'

class CatsController < ApplicationController
  def index
    @time = Time.now
    url = URI.parse('https://api.thecatapi.com/v1/images/search')
    request = Net::HTTP.get_response(url)
    request["Content-Type"] = 'application/json'
    request["x-api-key"] = '8957a3ef-aa09-404f-a80a-b2fcc16c3267'
    my_hash = JSON.parse(request.body)
    @url_image = my_hash[0]['url']
    @id_image = my_hash[0]['id']
  end
end