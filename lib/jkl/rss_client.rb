require 'hpricot'

module Jkl
  module Rss
    class << self

      def items(rss_doc)
        (rss_doc/:item)
      end
      
      def links(items)
        items.map{|item| attribute_from(item,:link)}
      end

      def descriptions(items)
        items.map do |item| 
          attribute_from(item, :description).gsub("<![CDATA[","").gsub("]]>","")
        end
      end

      def attribute_from(item, name)
        (item/name).inner_html
      end
      
    end
  end
end
