require "spec_helper"

describe Contest::Codeforces do
  describe :contests do
    context :first_element do
      subject { fetcher.contests.first }
      it { expect(subject[:contest]).to eq "Codeforces" }
    end
  end
  let(:fetcher) { Contest::Codeforces.new }
end
