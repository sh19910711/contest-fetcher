require "contest"
require "contest/utils/html"

module Contest
  class CodeChef
    extend Contest::Findable

    def contests(t = 0)
      table_items.map(&method(:table_item)).map(&method(:convert)).select do |item|
        item[:start_time_sec] >= t
      end
    end

    private
      def table_items
        Utils::HTML.http_get("https://www.codechef.com/contests")
          .match(/<h3>Future Contests<\/h3>(.*?)<h3>/m)[1]
          .scan(/<tr>.*?<\/tr>/m)
      end

      def table_item(item)
        item.scan(/<td.*?>(.*?)<\/td>/).flatten
      end

      def convert(item)
        {
          :contest => "CodeChef",
          :id => item[0],
          :name => Utils::HTML.strip_html(item[1]),
          :start_time_sec => Time.parse("#{item[2]} IST").to_i,
          :duration_sec => (Time.parse("#{item[3]} IST") - Time.parse("#{item[2]} IST")).to_i,
        }
      end
  end
end
