require 'hpricot'
require 'rest_client'

module URLDocHandler

  include RestClient
  
  USER_AGENT = 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.1) Gecko/20070107 Firefox/2.0.0.1'
  
  def get_text(text)
    str = ""
    text.to_s.gsub(/<\/?[^>]*>/, "").split("\r").each do |l| #remove tags
      l = l.chomp.gsub("\t",'').gsub(/\s{2,}/,'') # remove tabs and larger spaces
      str = str << l unless l.count(" ") < 5 #remove short lines - ususally just navigation
    end
    str
  end
  
  def from_url(url)
    begin
      Hpricot(get_from url)
    rescue  URI::InvalidURIError => e
      puts("WARN: Problem with getting a connection: #{e}")
    rescue SocketError => e
      puts("WARN: Could not connect to feed: #{e}")
    rescue Errno::ECONNREFUSED  => e
      puts("WARN: Connection refused: #{e}")
    end
  end
  
end
