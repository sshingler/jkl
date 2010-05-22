require "test/unit"
require "shoulda"
require "webmock/test_unit"
require "yaml"
require "lib/jkl"

class JklTest < Test::Unit::TestCase
  include WebMock

  context "Using Jkl" do    
    setup do
      stub_twitter
      stub_topix
      stub_news_article
    end
    
    should "GET trends" do
      trends = Jkl::trends
      assert trends.length == 10
      assert trends[0] == "London"
    end
    
    should "GET news article URLS for a trend" do
      articles = Jkl::topix_links(Jkl::trends[0])
      assert articles.length == 2
      assert articles[0] = "http://www.localnews8.com/Global/story.asp?S=10876507"
    end
    
    should "extract text from a news article" do
      articles = Jkl::topix_links(Jkl::trends[0])
      text = Jkl::Text::sanitize(Jkl::get_from(articles[0]))
      assert_not_nil text
    end
    
    should "extract tags from some text" do
      key = YAML::load_file('config/keys.yml')['calais']
      text = <<-EOF
        Barack Obama said today that he expects there 
        to be conflict within his new security team after 
        confirming Hillary Clinton as his choice for US Secretary of State."
      EOF
      tags = Jkl::Extraction::tags(key, text)
      assert tags["Person"][0] == "Barack Obama"
    end
  end
  
  private 
  def stub_twitter
    url = YAML::load_file('config/config.yml')['twitter']
    response = <<-EOF
    {"trends":[
      {"name":"London","url":"http://search.twitter.com/search?q=London"},
      {"name":"Geneva","url":"http://search.twitter.com/search?q=Geneva"},
      {"name":"Kabul","url":"http://search.twitter.com/search?q=Kabul"},
      {"name":"Chicago","url":"http://search.twitter.com/search?q=Chicago"},
      {"name":"Cannes","url":"http://search.twitter.com/search?q=Cannes"},
      {"name":"Verona","url":"http://search.twitter.com/search?q=Verona"},
      {"name":"Milan","url":"http://search.twitter.com/search?q=Milan"},
      {"name":"New York","url":"http://search.twitter.com/search?q=New%20York"},
      {"name":"Paris","url":"http://search.twitter.com/search?q=Paris"},
      {"name":"Melbourne","url":"http://search.twitter.com/search?q=Melbourne"}
      ],"as_of":"Sat, 1 Jan 1970 00:00:00 +0000"}
    EOF
    stub_request(:get, url).to_return(:body => response)
  end
  def stub_topix
    url = YAML::load_file('config/config.yml')['topix']
    response = File.read('test/fixtures/topix_rss.xml')
    stub_request(:get, "#{url}London").to_return(:body => response)
  end  
  def stub_news_article
    response = File.read('test/fixtures/bbc_story.html')
    stub_request(:get, "http://www.localnews8.com/Global/story.asp?S=10876507").to_return(
      :body => response
    )
  end
end
