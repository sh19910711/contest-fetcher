require "spec_helper"

describe ContestFetcher::Revolver do
  let(:revolver) { ContestFetcher::Revolver.new }

  let(:super_contest) do
    Class.new do
      def fetch
        ["Super Contest"]
      end
    end
  end

  let(:another_contest) do
    Class.new do
      def fetch
        ["Another Contest"]
      end
    end
  end

  describe :contests do
    context :empty do
      subject { revolver.contests }
      it { should_not include "Super Contest" }
      it { should_not include "Another Contest" }
    end

    context :single do
      before { revolver.add_fetcher another_contest.new }
      subject { revolver.contests }
      it { should_not include "Super Contest" }
      it { should include "Another Contest" }
    end

    context :multi_fetcher do
      before { revolver.add_fetcher super_contest.new }
      before { revolver.add_fetcher another_contest.new }
      subject { revolver.contests }
      it { should include "Super Contest" }
      it { should include "Another Contest" }
    end
  end
end
