require 'net/http'
require 'uri'
require 'json'

class ImagesController < ApplicationController
  include RequestToApi
  def show
    response = request_to_api('https://api.thecatapi.com/v1/images/' + params['id'], 'get', 0, 0)

    respond_to do |format|
      format.json do
        render json: {
            url: response['url']
        }
      end
    end
  end
end