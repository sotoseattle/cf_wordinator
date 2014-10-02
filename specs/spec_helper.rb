ENV['RACK_ENV']='test'

require 'minitest/autorun'
require 'rack/test'
require 'pry'

require_relative '../wordinator'

include Rack::Test::Methods

def app
  Sinatra::Application
end
