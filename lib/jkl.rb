require "cgi"
require "jkl/rest_client.rb"
require "jkl/rss_client.rb"
require "jkl/calais_client.rb"
require "jkl/url_doc_handler.rb"

module Jkl
  
  def self.headlines(keyphrase)
    get_from_as_xml "#{YAML::load_file("config/config.yml")["topix"]}#{CGI::escape(keyphrase)}"
  end

  def self.pages(headlines)
    items = get_items_from headlines
    descriptions = ""
    items.each do |item| 
      descriptions << attribute_from(item, :description).gsub("<![CDATA[","").gsub("]]>","")
    end
    descriptions
  end
  
  def self.descriptions(headlines)
    items = get_items_from headlines
    descriptions = []
    items.each do |item| 
      descriptions << attribute_from(item, :description).gsub("<![CDATA[","").gsub("]]>","")
    end
    descriptions
  end
  
  def self.links(headlines)
    items = get_items_from headlines
    links = []
    items.each do |item| 
      links << attribute_from(item, :link)
    end
    links
  end

  def self.tags(pages)
    Calais.process_document(
        :content => pages,
        :content_type => :text, 
        :license_id => YAML::load_file("config/keys.yml")["calais"]
    )
  end
  
end
