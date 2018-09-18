module FavouritePicturesId
  extend ActiveSupport::Concern

  def get_favourite_ids
    uri_favorites = URI.parse("https://api.thecatapi.com/v1/favourites")
    header = {'Content-Type': 'application/json', 'x-api-key': ENV['X_API_KEY']}
    request_favorites_get = Net::HTTP::Get.new(uri_favorites, header)
    response = response_to_request(uri_favorites, request_favorites_get)
    all_links = JSON.parse(response.body)
    all_favourites_ids = []
    all_links.each do |fav|
      all_favourites_ids << {fav_image_id: fav['image_id']}
    end
    delete_empty_hash(all_favourites_ids)
    all_favourites_ids
  end

  def response_to_request(uri, request)
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end
  end

  def delete_empty_hash(arr_links)
    arr_links.each{ |x| x.delete_if{|key, value| value.eql?nil}}
    arr_links.delete_if { |hash| hash.empty? }
  end
end
