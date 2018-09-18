module RequestToApi
  extend ActiveSupport::Concern
  def request_to_api(url)
    uri = URI.parse(url)
    header = {'Content-Type': 'application/json', 'x-api-key': ENV['X_API_KEY']}
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    req = Net::HTTP::Get.new(uri, header)
    response = http.request(req)
    JSON.parse(response.read_body)
  end
end
