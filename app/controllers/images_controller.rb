require 'net/http'
require 'uri'
require 'json'

class ImagesController < ApplicationController
  def show
    # respond_to do |format|
    #   format.json do
    #     render json: {
    #         url: params['id']
    #     }
    #   end
    # end
    id_image = params['id']
    url = "https://api.thecatapi.com/v1/images/"
    resp = request_to_api(url + id_image)
    puts 'aaa'


    respond_to do |format|
      format.json do
        render json: {
            url: resp['url']
        }
      end
    end
  end

  def request_to_api(url)
    @api_key = '8957a3ef-aa09-404f-a80a-b2fcc16c3267'
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    header = {'Content-Type': 'application/json', 'x-api-key': @api_key}
    req = Net::HTTP::Get.new(uri, header)
    response = http.request(req)
    JSON.parse(response.read_body)
  end
end