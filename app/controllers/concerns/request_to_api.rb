module RequestToApi
  extend ActiveSupport::Concern

  def request_to_api(url, request_type, image_id, user_id)
    uri = URI.parse(url)
    header = {'Content-Type': 'application/json', 'x-api-key': ENV['X_API_KEY']}
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    if(request_type.eql?'get')
      request = Net::HTTP::Get.new(uri, header)
      response = http.request(request)
      JSON.parse(response.body)
    elsif(request_type.eql?'post')
      request = Net::HTTP::Post.new(uri, header)
      body = {'image_id': image_id, 'sub_id': user_id}
      request.body = body.to_json
      response = http.request(request)
      response.read_body
    end
  end
end