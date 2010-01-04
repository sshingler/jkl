gem 'rack-test'

require 'spec/expectations'
require 'rack/test'
require 'hpricot'
require 'json'
require 'restclient'
require 'haml' 

require 'lib/jkl.rb'

include Jkl

class MyWorld
  include Rack::Test::Methods
end

World{MyWorld.new}
