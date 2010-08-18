require 'rspec'
require 'require_all'
require 'rails3_assist'
require 'code-spec'
require 'file-spec'
require 'active_support/inflector'      

require_all File.dirname(__FILE__) + '/matchers'    


RSpec.configure do |config|
  config.include RSpec::RubyContentMatchers::ActiveRecord::Migration
end


