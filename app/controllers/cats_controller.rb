require 'net/http'
require 'uri'
require 'json'

class CatsController < ApplicationController
  include GetCurrentTime
  include RequestToApi
  def index
    @time = get_time
    random_picture = request_to_api('https://api.thecatapi.com/v1/images/search', 'get', 0, 0)
    @url_image = random_picture[0]['url']
    @id_image = random_picture[0]['id']
  end
end