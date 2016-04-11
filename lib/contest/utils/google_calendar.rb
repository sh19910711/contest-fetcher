require "google/api_client/auth/key_utils"
require "google/apis/calendar_v3"

module Utils
  class GoogleCalendar
    def initialize(client_email, private_key, private_pass)
      @service = Google::Apis::CalendarV3::CalendarService.new
      key = OpenSSL::PKey::RSA.new(private_key, private_pass)

      service.authorization = Signet::OAuth2::Client.new(
        token_credential_uri: "https://accounts.google.com/o/oauth2/token",
        audience: "https://accounts.google.com/o/oauth2/token",
        scope: Google::Apis::CalendarV3::AUTH_CALENDAR_READONLY,
        issuer: client_email,
        signing_key: key
      )

      service.authorization.fetch_access_token!
    end

    protected
      attr_reader :service

      def items(calendar)
        service.list_events(calendar).items
      end
  end
end
