require "cgi"
require "jkl/rest_client.rb"
require "jkl/rss_client.rb"
require "jkl/calais_client.rb"
require "jkl/url_doc_handler.rb"

module Jkl
  
  class << self

    def headlines(feed, keyphrase)
      get_from_as_xml "#{feed}#{keyphrase}"
    end

    def pages(headlines)
      items = get_items_from headlines
      descriptions = ""
      items.each do |item| 
        descriptions << attribute_from(item, :description).gsub("<![CDATA[","").gsub("]]>","")
      end
      descriptions
    end

    def descriptions(headlines)
      items = get_items_from headlines
      descriptions = []
      items.each do |item| 
        descriptions << attribute_from(item, :description).gsub("<![CDATA[","").gsub("]]>","")
      end
      descriptions
    end

    def links(headlines)
      items = get_items_from headlines
      links = []
      items.each do |item| 
        links << attribute_from(item, :link)
      end
      links
    end

    def tags(key, text)
      nested_list = {}
      entities(key,text).each do |a| 
        nested_list = nested_list.merge!(a){ |key,v1,v2| v1+v2 }
      end
      nested_list
    end
    
    def entities(key,text)
      calais_response(key, text).entities.map{|e| {e.type => [e.attributes["name"]]}}
    end
    
  end
  
end
