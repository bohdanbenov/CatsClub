require 'net/http'
require 'uri'
require 'json'

class ImagesController < ApplicationController
  include RequestToApi
  def show
    response = request_to_api('https://api.thecatapi.com/v1/images/' + params['id'], 'get', 0, 0)
    change_pictures_url(response)
  end

  def change_pictures_url(respond_from_api)
    respond_to do |format|
      format.json do
        render json: {
            url: respond_from_api['url']
        }
      end
    end
  end
end