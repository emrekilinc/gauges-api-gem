require 'json'
require 'open-uri'

module Gauges
  class Client
    BASE_URL = "https://secure.gaug.es"
    TOKEN = "b078b3daa71689977fbbf6037fcd71bf"

    # Gets user information
    def me
      uri = "#{BASE_URL}/me"
      fetch uri
    end

    # Gets API clients
    def clients
      uri = "#{BASE_URL}/clients"
      fetch uri
    end

    # Gets gauges list
    def gauges
      uri = "#{BASE_URL}/gauges"
      fetch uri
    end

    # Gets gauges share information
    def shares id
      uri = "#{BASE_URL}/gauges/#{id}/shares"
      fetch uri
    end

    # Gets gauges content
    # optional date and page parameters with default values
    def content id, date = Date.today.to_s, page = 1
      uri = "#{BASE_URL}/gauges/#{id}/content?date=#{date}&page=#{page}"
      fetch uri
    end

    # Gets gauges referrers 
    # optional date and page parameters with default values
    def referrers id, date = Date.today.to_s, page = 1
      uri = "#{BASE_URL}/gauges/#{id}/referrers?date=#{date}&page=#{page}"
      fetch uri
    end

    # Gets gauges traffic 
    # optional date parameter with default value
    def traffic id, date = Date.today.to_s
      uri = "#{BASE_URL}/gauges/#{id}/traffic?date=#{date}"
      fetch uri
    end

    # Gets gauges resolutions 
    # optional date parameter with default value
    def resolutions id, date = Date.today.to_s
      uri = "#{BASE_URL}/gauges/#{id}/resolutions?date=#{date}"
      fetch uri
    end

    # Gets gauges technology 
    # optional date parameter with default value
    def technology id, date = Date.today.to_s
      uri = "#{BASE_URL}/gauges/#{id}/technology?date=#{date}"
      fetch uri
    end

    # Gets gauges terms 
    # optional date and page parameters with default values
    def terms id, date = Date.today.to_s, page = 1
      uri = "#{BASE_URL}/gauges/#{id}/terms?date=#{date}&page=#{page}}"
      fetch uri
    end

    # Gets gauges engines 
    # optional date parameter with default value
    def engines id, date = Date.today.to_s
      uri = "#{BASE_URL}/gauges/#{id}/engines?date=#{date}"
      fetch uri
    end

    # Gets gauges locations 
    # optional date parameter with default value
    def locations id, date = Date.today.to_s
      uri = "#{BASE_URL}/gauges/#{id}/locations?date=#{date}"
      fetch uri
    end

    private 

    def fetch uri
      JSON.parse open(uri, "X-Gauges-Token" => TOKEN).gets
    end

  end
end
