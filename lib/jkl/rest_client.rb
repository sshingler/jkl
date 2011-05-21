require 'net/http' 
require 'hpricot'

module Jkl
  class << self
    
    def post_to(url, post_args = {})
      begin
        uri = URI.parse(url)
        resp, data = Net::HTTP.post_form(uri, post_args)
        data
      rescue  URI::InvalidURIError => e
        puts("WARN: JKL Invalid URI: #{e}")
      rescue SocketError => e
        puts("WARN: JKL Could not connect: #{e}")
      rescue Errno::ECONNREFUSED  => e
        puts("WARN: JKL Connection refused: #{e}")
      end
    end
  
    def get_from(uri)
      begin
        response = Net::HTTP.get_response(URI.parse(uri))
        response.body
      rescue  URI::InvalidURIError => e
        puts("WARN: JKL Invalid URI: #{e}")
      rescue SocketError => e
        puts("WARN: JKL Could not connect: #{e}")
      rescue Errno::ECONNREFUSED  => e
        puts("WARN: JKL Connection refused: #{e}")
      end
    end
    
    def get_from_over_https(host, path)
      http = Net::HTTP.new(host, "443")
      http.use_ssl = true
      http.get2(path) # returns [status, data]
    end
  
    def get_xml_from(uri)
      Hpricot.XML(get_from(uri))
    end
    
    def document_from(text)
      Hpricot(text)
    end
  
  end
end
