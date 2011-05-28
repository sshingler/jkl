
module Jkl
  module Rss
    class << self
      def items(rss)
        rss_doc = Nokogiri::Slop(rss)
        rss_doc.rss.channel.item
      end
      
      def links(items)
        items.map{|item| item.link.inner_html}
      end
    end
  end
end
