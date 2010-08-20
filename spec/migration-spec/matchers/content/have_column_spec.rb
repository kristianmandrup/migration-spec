require 'spec_helper'

describe 'Have column matcher' do
  # use_orm :active_record
  use_helpers :app, :migration
      
  it "should match expected column layout" do
    fixtures_dir.should have_migration :do_columns do |klass|
      klass.should have_up do |up|
        up.should have_create_table :users do |user_tbl|
           user_tbl.should have_columns :name => :string, :age => :integer, :admin => :boolean
           user_tbl.should_not have_timestamps              
        end
      end

      klass.should have_down do |down|
        down.should have_call 'drop_table', :users
      end
    end
  end
end



