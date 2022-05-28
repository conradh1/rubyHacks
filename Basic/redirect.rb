require 'net/http'
require 'uri'

def fetch(uri_str, limit = 10)
  # You should choose better exception.
  raise ArgumentError, 'HTTP redirect too deep' if limit == 0

  url = URI.parse(uri_str)
  req = Net::HTTP::Get.new(url.path)
  response = Net::HTTP.start(url.host, url.port, use_ssl: true) { |http| http.request(req) }
  case response
  when Net::HTTPSuccess     then puts(response.body)
  when Net::HTTPRedirection then puts"redirects to #{response['location']}"
  else
    response.error!
  end
end

print fetch('http://www.ruby-lang.org/')