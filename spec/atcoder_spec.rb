require "spec_helper"

vcr_opts = { :cassette_name => "atcoder" }
describe Contest::AtCoder, :vcr => vcr_opts do
  describe :contests do
    subject { fetcher.contests }
    it { expect(subject.map {|contest| contest[:name] }).to include /AtCoder Regular/ }
    it { expect(subject.map {|contest| contest[:name] }).to include /東京大学プログラミングコンテスト/ }
  end

  describe :arc003 do
    subject { fetcher.find_first /AtCoder Regular/ }
  end

  include SpecHelper::GAPI
  let(:fetcher) { Contest::AtCoder.new(gapi_client_email, gapi_private_key, gapi_private_pass) }
end
