require "json"
require "rest_client"
require "calais"

module Jkl

  class << self
    
    #using the calais gem
    def calais_response(key, pages)
      Calais.process_document(
          :content => pages,
          :content_type => :text, 
          :license_id => key
      )
    end
  
    def get_from_calais(content)  
      begin
        license_id = YAML::load_file('config/keys.yml')['calais']
        c_uri = URI.parse('http://api.opencalais.com/enlighten/rest/')
        post_args = { 'licenseID' => license_id, 'content' => content, 
                    'paramsXML' => paramsXML('application/json') }
        post_to(c_uri, post_args)
      rescue Exception => e
        puts e
      end
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

    #jkl doesn't work with these aspects of the calais response, also removing blanks
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
