require "contest_fetcher"
require "contest/all"

require_relative "spec/helpers/gapi"
include Helpers::GAPI
atcoder = Contest::AtCoder.new(gapi_client_email, gapi_private_key, gapi_private_pass)
