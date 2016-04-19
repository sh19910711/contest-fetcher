module Contest
  module Mixins
    module Findable
      def find(name)
        contests.select {|item| item[:name].match(name) }
      end

      def find_first(name)
        find(name).first
      end
    end
  end
end
