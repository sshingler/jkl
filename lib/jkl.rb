require_relative "jkl/rss_client"
require_relative "jkl/text_client"

require "mechanize"
require "term-extract"

module Jkl
  class << self
    
    def get(url)
      agent = Mechanize.new
      agent.get(url).body
    end
    
    def links(feed)
      links = Jkl::Rss::links(Jkl::Rss::items(Jkl::get(feed)))
      links.each do |link|
        yield link if block_given?
      end
    end
    
    def tags(text)
      TermExtract.extract(text.force_encoding("UTF-8")).keys
    end
  end
end
