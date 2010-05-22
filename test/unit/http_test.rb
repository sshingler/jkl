require "test/unit"
require "shoulda"
require "yaml"
require "lib/jkl"

class HttpTest < Test::Unit::TestCase
  
  should "post data to postbin" do
    WebMock.allow_net_connect!
    url = "http://www.postbin.org/qhzvw0"
    args = { "arg0" => "foo", "arg1" => "bar" }
    assert (Jkl::post_to(url, args)).match(/Created/)
  end
end