require "contest/codeforces"
require "contest_fetcher"
require "vcr"

VCR.configure do |conf|
  conf.hook_into :webmock
  conf.default_cassette_options = {
    :serialize_with => :psych,
    :re_record_interval => 24 * 3600,
  }
  conf.allow_http_connections_when_no_cassette = true
end
