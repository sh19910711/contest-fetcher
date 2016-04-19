require "net/http"

module Contest
  module Utils
    class << self
      def http_get(url)
        Net::HTTP.get_response(URI.parse(url)).body
      end

      def strip_html(s)
        s.gsub /<.*?>/, ''
      end
    end
  end
end
