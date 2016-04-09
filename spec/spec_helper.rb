require "vcr"
require "contest_fetcher"
require "contest/codeforces"
require "contest/codechef"

VCR.configure do |conf|
  conf.cassette_library_dir = "spec/fixtures/vcr"
  conf.configure_rspec_metadata!
  conf.hook_into :webmock
  conf.default_cassette_options = {
    :serialize_with => :psych,
    :re_record_interval => 24 * 3600,
  }
end
