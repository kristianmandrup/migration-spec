require 'spec_helper'

Rails3::Migration::Assist.orm = :active_record

describe 'migration' do 
  # use_orm :active_record
  use_helpers :migration
    
  it "should have an create_account_migration file that contains an index method and two inserted comments" do
    read_migration(:do_columns)

    fixtures_dir.should have_migration :do_columns

    fixtures_dir.should generate_migration :do_columns do |migration_file|
      migration_file.should have_class_method :up
    end
  end
end