require "contest/types/plain"
require "codeforces"

module Contest
  class Codeforces < Types::Plain
    def contests(t = 0)
      all_contests.map(&method(:merge_info)).select do |c|
        c[:start_time_sec] >= t
      end
    end

    private
      def merge_info(item)
        item.merge(
          :contest => "Codeforces",
          :contest_short => "CF",
        )
      end

      def all_contests
        ::Codeforces.contests.map do |c|
          {
            :name => c.name,
            :start_time_sec => c.startTimeSeconds,
            :duration_sec => c.durationSeconds,
          }
        end
      end
  end
end
