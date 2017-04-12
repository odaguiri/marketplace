$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift File.dirname(__FILE__)
require 'marketplace'
require 'minitest/autorun'

class TestHelper < Minitest::Test
end
