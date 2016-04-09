require "google/api_client/auth/key_utils"
require "google/apis/calendar_v3"

module Contest
  class AtCoder
    def initialize(api_id, api_secret)
      @service = Google::Apis::CalendarV3::CalendarService.new
    end

    def contests
    end
  end
end
