require 'hpricot'
require 'rest_client'

module Jkl
  
  def sanitize_text(text)
    str = ""
    text.to_s.gsub(/<\/?[^>]*>/, "").split("\r").each do |l| # remove tags
      l = l.chomp.gsub("\t",'').gsub(/\s{2,}/,'') # remove tabs and larger spaces
      str << l unless l.count(" ") < 5 # remove short lines - ususally just navigation
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
