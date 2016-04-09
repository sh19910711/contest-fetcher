require "codeforces"

module Contest
  class Codeforces
    def contests(t = 0)
      ::Codeforces.contests.map do |c|
        {
          :contest => "Codeforces",
          :contest_short => "CF",
          :name => c.name,
          :start_time_sec => c.startTimeSeconds,
          :duration_sec => c.durationSeconds,
        }
      end.select do |c|
        c[:start_time_sec] >= t
      end
    end
  end
end
