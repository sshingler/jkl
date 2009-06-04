require 'rubygems'
require 'sinatra'
require 'hpricot'
require 'json'
require 'cgi'

require 'lib/rest_client.rb'
require 'lib/rss_client.rb'
require 'lib/calais_client.rb'
require 'lib/url_doc_handler.rb'

include Jkl

get '/' do
  twitter_json_url = YAML::load_file('config.yml')['twitter'] 
  output = JSON.parse get_from  twitter_json_url
  @trends = output['trends']
  haml :index
end

get '/feed/:tag' do |tag|
    rss = get_from_as_xml "#{YAML::load_file('config.yml')['topix']}#{CGI::escape(tag)}"
    items = get_items_from rss
    @descriptions = ""
    items.each{|item| @descriptions << attribute_from(item, :description).gsub("<![CDATA[",'').gsub("]]>",'')}
    cal_response = get_from_calais @descriptions
    @tags = get_tags_from_rdf(cal_response)
    haml :feed
end

not_found do
  "Sorry, that page could not be found: #{__FILE__}!"
end