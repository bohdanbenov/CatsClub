require 'net/http'
require 'uri'
require 'json'

class ImagesController < ApplicationController
  include RequestToApi
  def show
    resp = request_to_api('https://api.thecatapi.com/v1/images/' + params['id'])

    respond_to do |format|
      format.json do
        render json: {
            url: resp['url']
        }
      end
    end
  end
end