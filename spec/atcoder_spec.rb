require "spec_helper"

vcr_opts = { :cassette_name => "atcoder" }
describe Contest::AtCoder, :vcr => vcr_opts do
  describe :contests do
    subject do
      fetcher.contests.map {|contest| contest[:name] }
    end
    it { should include /AtCoder Regular/ }
    it { should include /東京大学プログラミングコンテスト/ }

    context :before_arc016 do
      subject do
        fetcher.contests(arc016_start-1).map {|contest| contest[:name] }
      end
      it { should include /AtCoder Regular Contest #016/ }
    end

    context :after_arc016 do
      subject do
        fetcher.contests(arc016_start+1).map {|contest| contest[:name] }
      end
      it { should_not include /AtCoder Regular Contest #016/ }
    end
  end

  describe :arc016 do
    subject { fetcher.find_first "AtCoder Regular Contest #016" }
    it { expect(subject[:name]).to eq "AtCoder Regular Contest #016" }
    it { expect(subject[:contest_short]).to be nil }
    it { expect(subject[:start_time_sec]).to eq arc016_start }
  end

  include Helpers::GAPI
  let(:fetcher) { Contest::AtCoder.new(gapi_client_email, gapi_private_key, gapi_private_pass) }
  let(:arc016_start) { DateTime.parse("2013/11/04 21:00:00 JST").to_time.to_i }
end
