require 'hpricot'
require 'rest_client'

module Jkl
  
  class << self
    
    def sanitize(text)
      str = ""
      text = text.to_s.gsub(/((<[\s\/]*script\b[^>]*>)([^>]*)(<\/script>))/i,"") #remove script tags - with contents
      text.to_s.gsub(/<\/?[^>]*>/, "").split("\r").each do |l| # remove all tags
        l = l.gsub(/^[ \t]/,"") #remove tabs
        l = l.gsub(/^[ \s]/,"")
        l.split("\n").each do |l|
          str << l unless l.count(" ") < 5 # remove short lines - ususally just navigation
        end
      end
      str
    end

    def from_doc(response)
      begin
        Hpricot(response)
      rescue  URI::InvalidURIError => e
        puts("WARN: Problem with getting a connection: #{e}")
      rescue SocketError => e
        puts("WARN: Could not connect to feed: #{e}")
      rescue Errno::ECONNREFUSED  => e
        puts("WARN: Connection refused: #{e}")
      end
    end

  end
  
end
