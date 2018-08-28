class FavouritesController < ApplicationController
  def index

  end

  def new

  end

  def create
    image_id = params['q']
    user_id = params['y']
    puts "my image id: #{image_id}"
    puts "my user id: #{user_id}"
    uri = URI.parse('https://api.thecatapi.com/v1/favourites')
    header = {'Content-Type': 'application/json', 'x-api-key': '8957a3ef-aa09-404f-a80a-b2fcc16c3267'}
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri, header)
    body = {'image_id': image_id, 'sub_id': user_id}
    request.body = body.to_json
    response = http.request(request)
    @resp_crt = response.read_body
    puts response.read_body
    render :new
  end
end