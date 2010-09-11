require 'spec_helper'

describe 'Have index matcher' do
  # use_orm :active_record
  use_helpers :app, :migration
      
  it "should match expected index layout" do
    fixtures_dir.should have_migration :do_index do |klass|
      klass.should have_up do |up|
        up.should have_add_index :name
        up.should have_add_tbl_index :users, :name
      end

      klass.should have_remove_tbl_index :users, :name
    end
  end
end



