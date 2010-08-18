require 'spec_helper'
require 'generator-spec'

RSpec::Generator.debug = true
require_generator :migration

describe 'migration_generator' do
  use_orm :active_record
  use_helpers :migration, :helper
  
  before :each do              
    setup_generator 'migration_generator' do
      tests MigrationGenerator
    end        
    remove_migration :create_users    
  end

  after :each do
  end
    
  it "should generate create_user migration" do    
    with_generator do |g|
      g.run_generator "create_users".args     
      
      puts "MAKE INTO ONE METHOD !!!"
      
      g.should generate_migration :create_users do |content|
        content.should have_migration :create_users
      end
    end
  end
end



