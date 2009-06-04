require 'sinatra'
 
Sinatra::Application.default_options.merge!(
  :run => false,
  :environment => :development
)
 
require 'app'
run Sinatra::Application