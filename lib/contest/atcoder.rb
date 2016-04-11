require "contest/utils/google_calendar"

module Contest
  class AtCoder < Utils::GoogleCalendar
    def contests
      regulars = 'atcoder.jp_gqd1dqpjbld3mhfm4q07e4rops@group.calendar.google.com'
      others = 'atcoder.jp_drp3qk1qgpb84vcdj418fsbo7k@group.calendar.google.com'
      items(regulars).concat items(others)
    end

    private
      attr_reader :service

      def items(calendar)
        service.list_events(calendar).items
      end
  end
end
