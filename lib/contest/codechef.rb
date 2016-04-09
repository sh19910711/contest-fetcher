require "contest/utils"

module Contest
  class CodeChef
    def contests(t = 0)
      items = http_get("https://www.codechef.com/contests")
        .match(/<h3>Future Contests<\/h3>(.*?)<h3>/m)[1]
        .scan(/<tr>.*?<\/tr>/m)

      items.map do |item|
        item.scan(/<td.*?>(.*?)<\/td>/).flatten
      end.map do |item|
        {
          :contest => "CodeChef",
          :id => item[0],
          :name => strip_html(item[1]),
          :start_time_sec => Time.parse("#{item[2]} IST").to_i,
          :duration_sec => (Time.parse("#{item[3]} IST") - Time.parse("#{item[2]} IST")).to_i,
        }
      end
    end
  end
end
