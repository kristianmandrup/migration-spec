require 'spec_helper'

describe 'Have table matcher' do
  # use_orm :active_record
  use_helpers :app, :migration
      
  it "should match expected tables layout" do
    fixtures_dir.should have_migration :do_tables do |klass|
      klass.should have_up do |up|
        up.should have_create_table :users
        up.should have_change_table :roles        
      end

      klass.should have_up do |up|
        up.should have_drop_table :users
        up.should have_rename_table :roles        
      end

    end
  end
end
