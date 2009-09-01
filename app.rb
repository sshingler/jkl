require 'rubygems'
require 'sinatra'
require 'hpricot'
require 'json'
require 'haml'

require 'lib/jkl.rb'

include Jkl

get '/' do
  twitter_json_url = YAML::load_file('config/config.yml')['twitter'] 
  output = JSON.parse get_from  twitter_json_url
  @trends = output['trends']
  haml :index
end

get '/tags/:keyphrase' do |keyphrase|
  @tags = tags pages headlines keyphrase
  
  @json_obj = JSON.parse( @tags )
  
  haml :feed
end

post '/tags' do
  keyphrase = params[:keyphrase]
  @tags = tags pages headlines keyphrase

  @json_obj = JSON.parse( @tags )

  haml :feed
end

get '/mock_home' do 
  output = JSON.parse File.open('features/mocks/twitter.json','r') {|f| f.readlines.to_s}
  @trends = output['trends']
  haml :index
end

get '/mock' do
  cal_response = File.open('features/mocks/calais.json','r') {|f| f.readlines.to_s}
  @tags = []
  @tags = get_tag_from_json(cal_response)
  @tags.each{|tag| 
    puts ""
    puts tag.inspect
  }
  haml :feed
end

get '/mock_pp' do
  cal_response = File.open('features/mocks/calais.json','r') {|f| f.readlines.to_s}
  @tags = []
  @tags = get_pp_tag_from_json(cal_response)
#  @tags.each{|tag| 
#    puts ""
#    puts tag.inspect
#  }
  haml :feed
end

not_found do
  "Sorry, that page could not be found: #{__FILE__}!"
end
