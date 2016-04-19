require "spec_helper"

vcr_opts = { :cassette_name => "atcoder" }
describe Contest::AtCoder, :vcr => vcr_opts do
  describe :contests do
    subject { fetcher.contests }
    it { expect(subject.map {|contest| contest[:name] }).to include /AtCoder Regular/ }
    it { expect(subject.map {|contest| contest[:name] }).to include /東京大学プログラミングコンテスト/ }
  end

  describe :arc003 do
    subject { fetcher.find_first "AtCoder Regular Contest #016" }
    it { expect(subject[:name]).to eq "AtCoder Regular Contest #016" }
    it { expect(subject[:contest_short]).to be nil }
    it { expect(subject[:start_time].to_s).to eq DateTime.parse("2013/11/04 21:00:00 JST").to_s }
    it { expect(subject[:start_time_sec]).to eq DateTime.parse("2013/11/04 21:00:00 JST").to_time.to_i}
  end

  include Helpers::GAPI
  let(:fetcher) { Contest::AtCoder.new(gapi_client_email, gapi_private_key, gapi_private_pass) }
end
