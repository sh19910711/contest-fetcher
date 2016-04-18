require "spec_helper"

vcr_opts = { :cassette_name => "atcoder" }
describe Contest::AtCoder, :vcr => vcr_opts do
  describe :contests do
    subject { fetcher.contests }
    it { expect(subject.map &:name).to include "AtCoder Regular" }
  end

  let(:fetcher) { p(GAPI.client_email, GAPI.private_key, GAPI.private_pass); Contest::AtCoder.new(GAPI.client_email, GAPI.private_key, GAPI.private_pass) }
end
