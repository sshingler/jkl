require 'lib/rest_client.rb'
require 'lib/rss_client.rb'
require 'lib/calais_client.rb'
require 'lib/url_doc_handler.rb'

module Jkl
  
  def headlines(keyphrase)
    get_from_as_xml "#{YAML::load_file('config.yml')['topix']}#{CGI::escape(keyphrase)}"
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
    get_tag_from_json(cal_response)
  end
  
end