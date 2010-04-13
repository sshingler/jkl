require "calais"

module Jkl
  module Extraction
    class << self

      def calais_response(key, text)
        Calais.process_document(
            :content => text,
            :license_id => key
        )
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
end
