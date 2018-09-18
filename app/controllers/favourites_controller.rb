require 'net/http'
require 'uri'

class FavouritesController < ApplicationController
  include RequestToApi

  def index
    response_body = request_to_api('https://api.thecatapi.com/v1/favourites', 'get', 0, 0)

    @all_favourite_links = []

    response_body.each do |fav|
      @all_favourite_links << {fav_image_id: fav['image_id']}
    end

    delete_empty_hash(@all_favourite_links)
  end

  def delete_empty_hash(arr_links)
    arr_links.each{ |x| x.delete_if{|key, value| value.eql?nil}}
    arr_links.delete_if { |hash| hash.empty? }
  end

  def new

  end

  def create
    @adding_result = request_to_api('https://api.thecatapi.com/v1/favourites', 'post', params['q'], params['y'])
    render :new
  end
end
