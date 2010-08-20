require 'spec_helper'

describe 'Have table matcher' do
  # use_orm :active_record
  use_helpers :app, :migration
      
  it "should match expected tables layout" do
    fixtures_dir.should have_migration :do_tables do |klass|
      klass.should have_up do |up|
        have_remove_tbl_column :users, :name
        have_rename_tbl_column :users, :name, :first_name
        have_add_tbl_column :users, :last_name # assume string
      end

      klass.should have_up do |up|
        have_add_tbl_column :users, :age, :integer
        have_change_tbl_column :users, :last_name # assume string
        have_change_tbl_column :users, :age, :integer
      end
    end
  end
end



