gem 'rack-test'

require 'spec/expectations'
require 'rack/test'
require 'hpricot'
require 'json'
require 'rest_client'

require 'lib/jkl'
include Jkl


class MyWorld
  include Rack::Test::Methods
end

World{MyWorld.new}
