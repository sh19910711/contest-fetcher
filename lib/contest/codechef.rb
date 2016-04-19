require "contest/types/html"

module Contest
  class CodeChef < Types::HTML
    def contests(t = 0)
      all_contests.map(&method(:merge_info)).select do |item|
        item[:start_time_sec] >= t
      end
    end

    private
      def all_contests
        table_items.map(&method(:table_item))
          .map(&method(:convert))
      end

      def table_items
        http_get("https://www.codechef.com/contests")
          .match(/<h3>Future Contests<\/h3>(.*?)<h3>/m)[1]
          .scan(/<tr>.*?<\/tr>/m)
      end

      def table_item(item)
        item.scan(/<td.*?>(.*?)<\/td>/).flatten
      end

      def merge_info(item)
        item.merge :contest => "CodeChef"
      end

      def convert(item)
        {
          :id => item[0],
          :name => strip_html(item[1]),
          :start_time_sec => Time.parse("#{item[2]} IST").to_i,
          :duration_sec => (Time.parse("#{item[3]} IST") - Time.parse("#{item[2]} IST")).to_i,
        }
      end
  end
end
