gem 'rack-test'

require 'spec/expectations'
require 'rack/test'

class MyWorld
  include Rack::Test::Methods
end

World{MyWorld.new}
