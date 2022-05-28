# nethttp.rb
require 'uri'
require 'net/http'

uri = URI.parse('https://gitlab.com')
res = Net::HTTP.get_response(uri)
if res.is_a?(Net::HTTPSuccess)
    puts res.code
elsif res.is_a?(Net::HTTPRedirection)
    puts res['location']
else
    puts "Error #{res.code}"
end