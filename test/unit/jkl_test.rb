require "test/unit"
require "shoulda"
require "webmock/test_unit"
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
      assert text.length > 10
    end
  
    should "get the keywords from a document" do
      document = Jkl::get(@url)
      text = Jkl::Text::plain_text(document,2)
      tags = Jkl::tags(text)
      assert ! tags.empty?
    end
  end
end