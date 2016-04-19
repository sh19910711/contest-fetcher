require "contest/mixins"
require "contest/utils/google_calendar"

module Contest
  class AtCoder < Utils::GoogleCalendar
    include Mixins::Findable
    def contests
      regulars = 'atcoder.jp_gqd1dqpjbld3mhfm4q07e4rops@group.calendar.google.com'
      others = 'atcoder.jp_drp3qk1qgpb84vcdj418fsbo7k@group.calendar.google.com'
      items(regulars).concat(items(others)).map do |item|
        { :contest => "AtCoder" }.merge(item)
      end
    end
  end
end
