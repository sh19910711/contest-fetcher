require "spec_helper"

vcr_opts = { :cassette_name => "codechef" }
describe Contest::CodeChef, :vcr => vcr_opts do
  describe :contests do
    subject { fetcher.contests }
    it { expect(subject.length).to eq 2 }

    context :element do
      subject { fetcher.contests.first }
      it { expect(subject[:contest]).to eq "CodeChef" }
      it { expect(subject[:contest_short]).to be_nil }
      it { expect(subject[:name]).to eq "April Cook-Off 2016" }
      it { expect(subject[:start_time_sec]).to eq 1460928600 }
      it { expect(subject[:duration_sec]).to eq 150 * 60 }
    end

    context :before_time do
      subject { fetcher.contests(1460928600-1).map {|c| c[:name] } }
      it { should include "April Cook-Off 2016" }
    end

    context :after_time do
      subject { fetcher.contests(1460928600+1).map {|c| c[:name] } }
      it { should_not include "April Cook-Off 2016" }
    end
  end

  before(:all) do
    puts "before all"
    WebMock.stub_request(:get, "https://www.codechef.com/contests").to_return(
      :body => [
        "<h3>Future Contests</h3>",
        "<tr>",
        "<td>COOK69</td>",
        "<td>April Cook-Off 2016</td>",
        "<td>2016-04-17 21:30:00</td>",
        "<td>2016-04-18 00:00:00</td>",
        "</tr>",
        "<tr>",
        "<td>MARCH16</td>",
        "<td>March Challenge 2016</td>",
        "<td>2016-03-04 15:00:00</td>",
        "<td>2016-03-15 15:00:00</td>",
        "</tr>",
        "<h3>Past Contests</h3>",
      ].join("\n")
    )
  end

  let(:fetcher) { Contest::CodeChef.new }
end
