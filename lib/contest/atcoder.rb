require "contest/types/google_calendar"

module Contest
  class AtCoder < Types::GoogleCalendar
    def contests(t = 0)
      regulars = 'atcoder.jp_gqd1dqpjbld3mhfm4q07e4rops@group.calendar.google.com'
      others   = 'atcoder.jp_drp3qk1qgpb84vcdj418fsbo7k@group.calendar.google.com'

      items(regulars).concat(items(others)).map(&method(:merge_info)).select do |item|
        item[:start_time_sec] >= t
      end
    end

    private
      def merge_info(item)
        item.merge(
          :contest => "AtCoder",
        )
      end
  end
end
