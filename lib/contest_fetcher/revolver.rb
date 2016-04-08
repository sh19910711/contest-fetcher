module ContestFetcher
  class Revolver
    attr_reader :fetchers

    def initialize
      @fetchers = []
    end

    def reset!
      @fetchers = []
    end

    def add_fetcher(fetcher)
      @fetchers << fetcher
    end

    def contests
      fetchers.reduce([]) do |contests, fetcher|
        contests += fetcher.fetch
      end
    end
  end
end
