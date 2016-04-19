require "contest/types/plain"
require "codeforces"

module Contest
  class Codeforces < Types::Plain
    def contests(t = 0)
      all_contests.select do |c|
        c[:start_time_sec] >= t
      end
    end

    private
      def all_contests
        ::Codeforces.contests.map do |c|
          {
            :contest => "Codeforces",
            :contest_short => "CF",
            :name => c.name,
            :start_time_sec => c.startTimeSeconds,
            :duration_sec => c.durationSeconds,
          }
        end
      end
  end
end
