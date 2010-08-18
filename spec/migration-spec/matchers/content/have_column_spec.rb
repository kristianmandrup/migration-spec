require 'spec_helper'

describe 'Have column matcher' do
  # use_orm :active_record
  # use_helper :migration
      
  it "should match expected column layout" do
    file_name = File.join(fixtures_dir, '001_do_columns.rb')
    content = File.read(file_name)            
    content.should have_migration :create_users do |klass|
      klass.should have_up do |up|
        up.should have_create_table :users do |user_tbl|
          user_tbl.should have_columns :name => :string, :age => :integer, :admin => :boolean
          user_tbl.should_not have_timestamps              
        end
      end

      klass.should have_down do |up|
        up.should have_drop_table :users
      end
    end
  end
end



