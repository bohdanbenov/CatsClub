require 'net/http'
require 'uri'

class FavouritesController < ApplicationController
  def index
    @all_favorites_links = []
    get_fev_ids
    @all_favorites_links.each{ |x| x.delete_if{|key, value| value.eql?nil}}
    @all_favorites_links.delete_if { |hash| hash.empty? }
    @all_links = []
    @all_favorites_links.each{|x| x.each{|key, value| @all_links << value}}
  end

  def get_fev_ids
    uri_favorites = URI.parse("https://api.thecatapi.com/v1/favourites")
    header = {'Content-Type': 'application/json', 'x-api-key': '8957a3ef-aa09-404f-a80a-b2fcc16c3267'}
    request_favorites_get = Net::HTTP::Get.new(uri_favorites, header)
    response = response_to_request(uri_favorites, request_favorites_get) #arr of hashes

    @all_favorites = JSON.parse(response.body)

    @all_favorites.each do |fav|
      uri_fav = URI.parse("https://api.thecatapi.com/v1/images/#{fav['image_id']}")
      image_link_response = Net::HTTP.get_response(uri_fav)
      image_link_hash = JSON.parse(image_link_response.body)
      @all_favorites_links << {image_link: image_link_hash['url']}
    end
  end

  def response_to_request(uri, request)
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end
  end

  def get_img(url)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    header = {'Content-Type': 'application/json', 'x-api-key': '8957a3ef-aa09-404f-a80a-b2fcc16c3267'}
    request = Net::HTTP::Get.new(uri, header)
    response = http.request(request)
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