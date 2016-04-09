require "spec_helper"

vcr_opts = { :cassette_name => "codeforces" }
describe Contest::Codeforces, :vcr => vcr_opts do
  describe :contests do
    context :element do
      subject { fetcher.contests.last }
      it { expect(subject[:contest]).to eq "Codeforces" }
      it { expect(subject[:contest_short]).to eq "CF" }
      it { expect(subject[:name]).to eq "Codeforces Beta Round #1" }
      it { expect(subject[:start_time_sec]).to eq 1266580800 }
      it { expect(subject[:duration_sec]).to eq 120 * 60 }
    end

    context :before_time do
      subject { fetcher.contests(1266580800-1).map {|c| c[:name] } }
      it { should include "Codeforces Beta Round #1" }
    end

    context :after_time do
      subject { fetcher.contests(1266580800+1).map {|c| c[:name] } }
      it { should_not include "Codeforces Beta Round #1" }
    end
  end

  let(:fetcher) { Contest::Codeforces.new }
end
