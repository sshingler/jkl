require "test/unit"
require "shoulda"
require "webmock/test_unit"
require "yaml"
require_relative "../../lib/jkl"

class JklTest < Test::Unit::TestCase
  include WebMock::API

  context "Jkl: When handling documents, plain text and tags" do
    setup do
      @url = "http://www.bbc.co.uk"
      response = File.read('test/fixtures/bbc_story.html')
      stub_request(:get, @url).to_return(
          :status => 200, 
          :body => response, 
          :headers => {'Content-Type' => 'text/html'})
    end
    
    should "get a document from a URL" do
      doc = Jkl::get(@url)
      assert_not_nil doc
    end
  
    should "get the plain text version of a document" do
      document = Jkl::get(@url)
      text = Jkl::Text::plain_text(document,2)
      assert_equal 9009, text.length
    end
  
    should "get the keywords from a document" do
      document = Jkl::get(@url)
      text = Jkl::Text::plain_text(document,2)
      tags = Jkl::tags(text)
      assert ! tags.empty?
    end
  end
  
  context "Jkl: When handling RSS" do
    should "get links from a feed" do
      feed = "http://feeds.bbci.co.uk/news/rss.xml"
      response = File.read('test/fixtures/topix_rss.xml')
      stub_request(:get, "http://feeds.bbci.co.uk/news/rss.xml").
          to_return(:status => 200, :body => response, :headers => {})
      first_link = "http://www.localnews8.com/Global/story.asp?S=10876507"
      assert_equal first_link, Jkl::links(feed).first
    end
  end
  
  private
    def calais_key
      keys = "config/keys.yml"
      raise "READ:::::::: You need to create #{keys} and put your calais credentials in it." unless File.exist?(keys)
      YAML::load_file(keys)['calais']
    end
end