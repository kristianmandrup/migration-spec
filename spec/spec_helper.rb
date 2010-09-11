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

def project_dir
  File.dirname(__FILE__) + '/..'
end

def temp_dir name
  File.join(project_dir, name)  
end

def make_temp_dir name   
  FileUtils.mkdir_p temp_dir(name)
  temp_dir(name)
end

def remove_temp_dir name   
  FileUtils.rm_rf temp_dir(name)
end


RSpec.configure do |config| 
  config.before do                                         
    rails_root_dir = Rails3::Assist::Directory.rails_root = fixtures_dir #temp_dir('tmp_rails')
  end

  config.after do
    remove_temp_dir fixtures_dir # 'tmp_rails'
  end
   
end

Rails::Migration::Assist.orm = :active_record 



  