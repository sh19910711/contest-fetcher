require "spec_helper"

describe Contest::Codeforces do
  describe :contests do
    context :element do
      subject do
        VCR.use_cassette :codeforces do
          fetcher.contests.last
        end
      end
      it { expect(subject[:contest]).to eq "Codeforces" }
      it { expect(subject[:contest_short]).to eq "CF" }
      it { expect(subject[:name]).to eq "Codeforces Beta Round #1" }
      it { expect(subject[:start_time_sec]).to eq 1266580800 }
      it { expect(subject[:duration_sec]).to eq 120 * 60 }
    end
  end

  let(:fetcher) { Contest::Codeforces.new }
end
