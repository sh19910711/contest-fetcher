require "contest_fetcher"
require "vcr"

VCR.configure do |conf|
  conf.cassette_library_dir = "spec/vcr"
  conf.hook_into :webmock
  conf.configure_rspec_metadata!
  conf.preserve_exact_body_bytes { true }
  conf.default_cassette_options = {
    :serialize_with => :psych,
    :re_record_interval => 24 * 3600,
  }
  conf.ignore_hosts "codeclimate.com"
end
