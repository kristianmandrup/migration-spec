require 'rspec'
require 'rspec/autorun'
require 'migration-spec'

# RSpec::Generator.configure do |config|
#   config.debug = false
#   config.remove_temp_dir = true
#   config.default_rails_root(__FILE__) 
#   config.lib = File.dirname(__FILE__) + '/../lib'
#   # config.logger = :file # :stdout  
# end

def fixtures_dir
  File.expand_path(File.dirname(__FILE__) + '/migration-spec/fixtures')
end


  