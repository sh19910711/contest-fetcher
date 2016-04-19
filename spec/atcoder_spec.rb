require "spec_helper"

vcr_opts = { :cassette_name => "atcoder" }
describe Contest::AtCoder, :vcr => vcr_opts do
  describe :contests do
    subject { fetcher.contests }
    it { expect(subject.map {|contest| contest[:name] }).to include /AtCoder Regular/ }
    it { expect(subject.map {|contest| contest[:name] }).to include /東京大学プログラミングコンテスト/ }
  end

  let(:fetcher) { Contest::AtCoder.new(GAPI.client_email, GAPI.private_key, GAPI.private_pass) }
end
