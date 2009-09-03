require 'cgi'
require 'jkl/rest_client.rb'
require 'jkl/rss_client.rb'
require 'jkl/calais_client.rb'
require 'jkl/url_doc_handler.rb'

module Jkl
  
  def headlines(keyphrase)
    get_from_as_xml "#{YAML::load_file('config/config.yml')['topix']}#{CGI::escape(keyphrase)}"
  end

  def pages(headlines)
    items = get_items_from headlines
    descriptions = ""
    items.each do |item| 
      descriptions << attribute_from(item, :description).gsub("<![CDATA[",'').gsub("]]>",'')
    end
    descriptions
  end

  def tags(pages)
    cal_response = get_from_calais(pages)
    get_calais_metadata(cal_response)
  end
  
end
