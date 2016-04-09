require "codeforces"

module Contest
  class Codeforces
    def contests(t = 0)
      ::Codeforces.contests.select do |c|
        c.startTimeSeconds >= t
      end.map do |c|
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
