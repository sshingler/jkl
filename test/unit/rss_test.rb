require "test/unit"
require "shoulda"
require "webmock/test_unit"
require "yaml"
require_relative "../../lib/jkl"

class RssTest < Test::Unit::TestCase
  include WebMock::API

  context "Jkl: Can work with RSS" do
    setup do
      @feed = "http://news.google.com/news?cf=all&hl=en&ned=uk&output=rss&pz=1&q=topic:vladimir_putin"
      response = File.read('test/fixtures/google_news.xml')
      
      stub_request(:get, @feed).
        with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => response, :headers => {})
    end
    
    should "extract titles, links and descriptions from an RSS feed" do
      items = Jkl::Rss::items(@feed)
      assert_equal 10, Jkl::Rss::titles(items).count
      assert_equal 10, Jkl::Rss::links(items).count
      assert_equal 10, Jkl::Rss::descriptions(items).count
    end
  end
end