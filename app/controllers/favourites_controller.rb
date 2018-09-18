require 'net/http'
require 'uri'

class FavouritesController < ApplicationController
  include FavouritePicturesId
  include AddToFavourites

  def index
    @all_favorites_links = get_favourite_ids
  end

  def new

  end

  def create
    @adding_result = add_to_favourites(params['q'], params['y'])
    render :new
  end
end
