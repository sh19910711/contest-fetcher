require "vcr"
require "contest_fetcher"
require "contest/codeforces"
require "contest/codechef"
require "contest/atcoder"

module GAPI
  class << self
    def client_email
      ENV["GAPI_CLIENT_EMAIL"]
    end

    def private_key
      ENV["GAPI_PRIVATE_KEY"]
    end

    def private_pass
      ENV["GAPI_PRIVATE_PASS"]
    end
  end
end

VCR.configure do |conf|
  conf.cassette_library_dir = "spec/fixtures/vcr"
  conf.configure_rspec_metadata!
  conf.hook_into :webmock
  conf.default_cassette_options = {
    :serialize_with => :psych,
    :re_record_interval => 24 * 3600,
  }
end
