require 'hpricot'

module Jkl
  
  def self.get_items_from(rssdoc)
    items = []
    (rssdoc/:item).each { |rssitem| items.push rssitem } unless rssdoc==nil
    items
  end
  
  def self.attribute_from(item, name)
    (item/name).inner_html
  end
  
end
