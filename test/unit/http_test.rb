require "test/unit"
require "shoulda"
require "yaml"
require_relative "../../lib/jkl"

class HttpTest < Test::Unit::TestCase
  
  should "post data to postbin" do
    WebMock.allow_net_connect!
    url = "http://www.postbin.org/qhzvw0"
    args = { "arg0" => "foo", "arg1" => "bar" }
    assert (Jkl::post_to(url, args)).match(/Created/)
  end
  
  should "be able to make a request over https" do
    stub_request(:get, "https://www.test.com/").
      with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => "", :headers => {})
    
    host = "www.test.com"
    path = "/"
    status, data = Jkl::get_from_over_https(host,path)
    assert_equal "200", status.code
    assert_not_nil data
  end
end