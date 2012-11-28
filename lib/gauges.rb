require 'json'
require 'open-uri'

module Gauges
  class Client
    # https://secure.gaug.es/me
    # https://secure.gaug.es/clients
    # https://secure.gaug.es/gauges
    # https://secure.gaug.es/gauges/:id/shares
    # https://secure.gaug.es/gauges/:id/content
    # https://secure.gaug.es/gauges/:id/referrers
    # https://secure.gaug.es/gauges/:id/traffic
    # https://secure.gaug.es/gauges/:id/resolutions
    # https://secure.gaug.es/gauges/:id/technology
    # https://secure.gaug.es/gauges/:id/terms
    # https://secure.gaug.es/gauges/:id/engines
    # https://secure.gaug.es/gauges/:id/locations

    BASE_URL = "https://secure.gaug.es"
    TOKEN = "b078b3daa71689977fbbf6037fcd71bf"

    def client
      uri = "#{BASE_URL}/me"
      fetch uri
    end

    private 

    def fetch uri
      JSON.parse open(uri, "X-Gauges-Token" => TOKEN).gets
    end

  end
end
