require "json"
require "calais"

require "rest_client"

module Jkl
  module Extraction
    class << self
    
      #using the calais gem
      def calais_response(key, pages)
        Calais.process_document(
            :content => pages,
            :content_type => :text, 
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
    
      #not using calais gem, experimenting with json response
      def get_from_calais(key, content)  
        post_args = { 
            "licenseID" => key, 
            "content" => content, 
            "paramsXML" => paramsXML("application/json") 
        }
        Jkl::post_to(URI.parse("http://api.opencalais.com/enlighten/rest/"), post_args)
      end
  
      def get_tag_from_json(response)
        result = JSON.parse response
        result.delete_if {|key, value| key == "doc" } # ditching the doc
        cleaned_result = []
        result.each do |key,tag| 
          tag = Jkl::clean_unwanted_items_from_hash tag
          cleaned_result << tag
          yield tag if block_given?
        end
        cleaned_result
      end

      def clean_unwanted_items_from_hash h
        h.delete_if {|k, v| k == "relevance" }
        h.delete_if {|k, v| k == "instances" }
        h.delete_if {|k, v| v == "N/A"}
        h.delete_if {|k, v| v == []}
        h.delete_if {|k, v| v == ""}
        h.delete_if {|k, v| k == "_typeGroup"}
        h
      end
  
      private

      def paramsXML(format)
       <<-paramsXML; 
        <c:params xmlns:c="http://s.opencalais.com/1/pred/"
               xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
               <c:processingDirectives
               c:contentType="text/txt"
               c:outputFormat="#{format}">
               </c:processingDirectives>  
               <c:userDirectives />
               <c:externalMetadata />
               </c:params>
        paramsXML
      end

    end
  end
end
