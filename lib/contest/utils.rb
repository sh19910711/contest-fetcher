require "net/http"

def http_get(url)
  Net::HTTP.get_response(URI.parse(url)).body
end

def strip_html(s)
  s.gsub /<.*?>/, ''
end
