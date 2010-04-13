require "lib/jkl/rss_client"
require "lib/jkl/rest_client"
require "lib/jkl/calais_client"
require "lib/jkl/text_client"

module Jkl
  class << self
    
    def links(feed)
      links = Jkl::Rss::links(Jkl::Rss::items(Jkl::get_xml_from(feed)))
      links.each do |link|
        yield link if block_given?
      end
    end
    
    def tags(key, link)
      text = Jkl::Text::sanitize(Jkl::get_from(link))
      Jkl::Extraction::tags(key, text)
    end

  end
end
