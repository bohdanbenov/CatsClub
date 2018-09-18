module AddToFavourites
  extend ActiveSupport::Concern
  def add_to_favourites(image_id, user_id)
    uri = URI.parse('https://api.thecatapi.com/v1/favourites')
    header = {'Content-Type': 'application/json', 'x-api-key': ENV['X_API_KEY']}
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri, header)
    body = {'image_id': image_id, 'sub_id': user_id}
    request.body = body.to_json
    response = http.request(request)
    response.read_body
  end
end
