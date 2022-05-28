# nethttp.rb
require 'uri'
require 'net/http'
require 'benchmark'
# Conrad Holmberg 


# Public: A class for making http requests to a uri and gives errors base on a 
# benchmarked timeout.
class HttpRequestor
    attr_accessor :uri
    attr_accessor :timelimit
    attr_accessor :requests
    attr_accessor :verbose
    @@reponse = nil #class variable used for response object
    
    # Create the object
    # uri - Uniform Resource Identifier (URI) used for making requests to.
    # timelimit - Measures in seconds, if a request is over the timelimit, a notification is given.
    # requests - An integer for the number of requests. A value of -1 is infinity and not beyond.
    # verbose - boolean to print results of all requests and errors.
    def initialize(uri = "https://gitlab.com", timelimit = 0.5, requests = 5, verbose = false)
        @uri = URI.parse(uri)
        @timelimit = timelimit
        @requests = requests
        @verbose = verbose
    end #init

    # starts the loop for making a number of requests given in the initialize method
    # Only prints out results longer than timelimit unless verbose.
    def start         
        puts"Starting Request(s) on host #{@uri.host}"
        i = 0 # counter
        puts"Request\tTime\t\t\tResponse" if @verbose # header
        while i < requests do            
            benchmark = Benchmark.measure { @@response= Net::HTTP.get_response(uri) } #measure time for response
            time = benchmark.real # assign the real time as a float

            # regardless of reasponse if the response is over the time limit, report it.
            if time >= timelimit
                puts("Request #{i} time was #{time}. This is over given time limit of #{timelimit} by #{time-timelimit}.")
            end
            
            # Print all response in verbose mode.
            if @verbose
                if @@response.is_a?(Net::HTTPSuccess)
                    puts "#{i+1}\t#{time}\tSuccess #{@@response.message}"
                elsif @@response.is_a?(Net::HTTPRedirection)
                    puts "#{i+1}\t#{time}\tRedirect: #{@@response.message}"
                else
                    puts "#{i+1}\t#{time}\tError: #{@@response.code}"
                end    
            end
            i += 1           
        end #while
    end #start
    
end #class

if __FILE__ == $0
    requestor = HttpRequestor.new
    requestor.verbose = true
    requestor.start    
end #main

