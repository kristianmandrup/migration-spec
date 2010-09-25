require 'rspec/core'
require 'require_all'
require 'rails-app-spec'
require 'active_support/inflector'      

require_all File.dirname(__FILE__) + '/matchers'    

RSpec.configure do |config|
  config.include RSpec::RubyContentMatchers::ActiveRecord::Migration  
  config.include RSpec::RailsApp::Artifact::Matchers
end


