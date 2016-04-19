module Contest
  module Types
    module Mixin
      def find(name)
        contests.select {|item| item[:name].match(name) }
      end

      def find_first(name)
        find(name).first
      end
    end
  end
end
