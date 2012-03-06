require "open-uri"

module Jkl
  module Rss
    class << self
      def items(rss_feed_url)
        ndoc = Nokogiri::XML(open(rss_feed_url))
        ndoc.css("item")
      end

      def titles(items)
        items.css("title").map{ |title| title.inner_html }
      end
      
      def links(items)
        items.css("link").map{ |link| link.inner_html }
      end

      def descriptions(items)
        items.css("description").map{ |description| description.inner_html }
      end
    end
  end
end
