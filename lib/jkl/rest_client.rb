require 'net/http' 
require 'hpricot'

module Jkl
  class << self
    
    def post_to(uri, post_args)
      begin
        resp, data = Net::HTTP.post_form(uri, post_args)
        data
      rescue  URI::InvalidURIError => e
        puts("WARN: Invalid URI: #{e}")
      rescue SocketError => e
        puts("WARN: Could not connect: #{e}")
      rescue Errno::ECONNREFUSED  => e
        puts("WARN: Connection refused: #{e}")
      end
    end
  
    def get_from(uri)
      begin
        response = Net::HTTP.get_response(URI.parse(uri))
        response.body
      rescue  URI::InvalidURIError => e
        puts("WARN: Invalid URI: #{e}")
      rescue SocketError => e
        puts("WARN: Could not connect: #{e}")
      rescue Errno::ECONNREFUSED  => e
        puts("WARN: Connection refused: #{e}")
      end
    end
  
    def get_xml_from(uri)
      Hpricot.XML(get_from(uri))
    end
    
    def document_from(text)
      Hpricot(text)
    end
  
  end
end
