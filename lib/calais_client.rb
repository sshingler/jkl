require 'lib/rest_client'

module Jkl

LICENSE_ID = YAML::load_file('keys.yml')['calais']
C_URI = URI.parse('http://api.opencalais.com/enlighten/rest/')

  def call(content)  
    post_args = { 'licenseID' => LICENSE_ID, 'content' => content, 'paramsXML' => paramsXML('text/simple') }
    post_to(C_URI, post_args)
  end
  
  def get_tags(response)
    h = {}
    index1 = response.index('terms of service.-->')
    index1 = response.index('<!--', index1)
    index2 = response.index('-->', index1)
    txt = response[index1+4..index2-1]
    lines = txt.split("\n")
    lines.each {|line|
      index = line.index(":")
      h[line[0...index]] = line[index+1..-1].split(',').collect {|x| x.strip} if index
    }
    h
  end

  private

  def paramsXML(format)
   <<-paramsXML; 
    <c:params xmlns:c="http://s.opencalais.com/1/pred/"
           xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
           <c:processingDirectives
           c:contentType="text/raw"
           c:outputFormat="'+format+'">
           </c:processingDirectives>  
           <c:userDirectives />
           <c:externalMetadata />
           </c:params>
    paramsXML
  end
end