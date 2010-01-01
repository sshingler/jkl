require "jkl/rest_client.rb"
require "jkl/rss_client.rb"
require "jkl/calais_client.rb"
require "jkl/url_doc_handler.rb"

module Jkl
  
  class << self

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
