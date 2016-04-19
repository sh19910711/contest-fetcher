module Helpers
  module GAPI
    def gapi_client_email
      ENV["GAPI_CLIENT_EMAIL"]
    end

    def gapi_private_key
      ENV["GAPI_PRIVATE_KEY"].gsub("\\n", "\n")
    end

    def gapi_private_pass
      ENV["GAPI_PRIVATE_PASS"]
    end
  end
end
