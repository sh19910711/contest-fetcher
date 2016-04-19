module Contest
  module Findable
    def find(name)
      p "hello"
      contests.select {|item| item == name }
    end

    def find_first(name)
      find(name).first
    end
  end
end
