require 'spec_helper'

describe 'Have up and down method matcher' do
  # use_orm :active_record
  use_helpers :app, :migration
      
  it "should match expected method layout" do
    fixtures_dir.should have_migration :do_up_down do |klass|
      klass.should have_up
      klass.should have_down
    end
  end
end



