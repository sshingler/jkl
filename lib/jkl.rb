$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require "jkl/rss_client"
require "jkl/rest_client"
require "jkl/calais_client"
require "jkl/text_client"

module Jkl
  class << self
    
    def links(feed)
      links = Jkl::Rss::links(Jkl::Rss::items(Jkl::get_xml_from(feed)))
      links.each do |link|
        yield link if block_given?
      end
    end
    
    def topix_links(keyphrase)
      url = YAML::load_file('config/config.yml')['topix']
      links("#{url}#{keyphrase}")
    end
    
    def tags(key, link)
      text = Jkl::Text::sanitize(Jkl::get_from(link))
      Jkl::Extraction::tags(key, text)
    end

    def trends
      url = YAML::load_file('config/config.yml')['twitter'] || 
          "http://search.twitter.com/trends.json"
      JSON.parse(Jkl::get_from(url))["trends"].map{|t| t["name"]}
    end
  end
end
