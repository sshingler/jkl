require 'net/http' 

module RestClient
  
  def post_to(uri, post_args)
    resp, data = Net::HTTP.post_form(uri, post_args)
    data
  end
  
  def get_from(uri)
    res = Net::HTTP.get_response(URI.parse(uri))
    res.body
  end
  
end