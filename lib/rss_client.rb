require 'hpricot'
require 'open-uri'

module Jkl
  
  USER_AGENT = 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.1) Gecko/20070107 Firefox/2.0.0.1'
  
  def from_rss(url)
    begin
      Hpricot.XML(open(url, 'User-Agent' => USER_AGENT))
    rescue  URI::InvalidURIError => e
      puts("WARN: Problem with getting a connection: #{e}")
    rescue SocketError => e
      puts("WARN: Could not connect to feed: #{e}")
    rescue Errno::ECONNREFUSED  => e
      puts("WARN: Connection refused: #{e}")
    end
  end
  
  def get_items(rssdoc)
    items = []
    (rssdoc/:item).each { |rssitem| items.push rssitem } unless rssdoc==nil
    items
  end
  
  def attribute_from(item, name)
    (item/name).inner_html
  end
  
end
