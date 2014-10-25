module Pewpew
  class Data
    require 'net/http'
    require 'uri'

    DATA_URL = 'http://www.betvictor.com/live/en/live/list.json'.freeze

    class << self

      def data
        @@data
      end

      def sync!
        uri = URI.parse DATA_URL
        http = Net::HTTP.new uri.host, uri.port
        reply = http.get uri.path
        if '200' == reply.code
          @@data = JSON.parse(reply.body)['sports']
          true
        else
          raise Pewpew::Errors::Api.new 'failed to sync data'
        end
      end

    end

  end
end
