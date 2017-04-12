# frozen_string_literal: true

lib = File.dirname(__FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'rubygems'
require 'bigdecimal'
require 'yaml'
require 'erb'

require 'marketplace/item'
require 'marketplace/checkout'
require 'marketplace/promotional_rule'

# Our marketplace module
module Marketplace
  def self.root
    File.dirname(File.expand_path('../', __FILE__))
  end
end
