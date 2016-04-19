require "google/api_client/auth/key_utils"
require "google/apis/calendar_v3"
require "contest/types/plain"

module Contest
  module Types
    class GoogleCalendar < Plain
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
        def items(calendar)
          service.list_events(calendar).items.select do |item|
            item.start.date_time.to_s != ""
          end.map do |item|
            {
              :name => item.summary,
              :start_time_sec => start_sec(item),
              :duration_sec => end_sec(item) - start_sec(item),
            }
          end
        end

      private
        attr_reader :service

        def end_sec(item)
          item.end.date_time.to_time.to_i
        end

        def start_sec(item)
          item.start.date_time.to_time.to_i
        end
    end
  end
end
