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
          :start => c.startTimeSeconds,
          :duration => c.durationSeconds,
        }
      end
    end
  end
end
