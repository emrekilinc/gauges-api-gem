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

    #Gets gauges content
    def content id
      uri = "#{BASE_URL}/gauges/#{id}/content"
      fetch uri
    end

    #Gets gauges referrers 
    def referrers id
      uri = "#{BASE_URL}/gauges/#{id}/referrers"
      fetch uri
    end

    #Gets gauges traffic 
    def traffic id
      uri = "#{BASE_URL}/gauges/#{id}/traffic"
      fetch uri
    end

    #Gets gauges resolutions 
    def resolutions id
      uri = "#{BASE_URL}/gauges/#{id}/resolutions"
      fetch uri
    end

    #Gets gauges technology 
    def technology id
      uri = "#{BASE_URL}/gauges/#{id}/technology"
      fetch uri
    end

    #Gets gauges terms 
    def terms id
      uri = "#{BASE_URL}/gauges/#{id}/terms"
      fetch uri
    end

    #Gets gauges engines 
    def engines id
      uri = "#{BASE_URL}/gauges/#{id}/engines"
      fetch uri
    end

    #Gets gauges locations 
    def locations id
      uri = "#{BASE_URL}/gauges/#{id}/locations"
      fetch uri
    end

    private 

    def fetch uri
      JSON.parse open(uri, "X-Gauges-Token" => TOKEN).gets
    end

  end
end
