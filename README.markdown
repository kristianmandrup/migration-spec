# Migration spec

RSpec 2 matchers to let you specify expectations for your migration files and/or generators that generate migrations.
There is currently only support for Active Record migrations.

## Install

<code>gem install migration-spec</code> 

## Usage

See specs for how to use it!

Example:
<pre>  require 'rspec'
  require 'rspec/autorun'
  require 'migration-spec'

  def other_rails_app
    File.expand_path(File.dirname(__FILE__) + '/rails_app')
  end    

  it "should match expected column layout" do

    Rails.root.should have_migration :add_columns
    
    other_rails_app.should have_migration :do_columns do |klass|
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
</pre>

## Notes

The gem depends on 'code-spec', which I plan to improve with better argument handling than the current 'crude' approach.
This will make the 'have_call' statements used in the various matchers much better:

I am targeting to replace the current format:
<pre>
    have_call 'rename_column', ":#{tbl_name}\s*,\s*:#{old_name},\s*:#{new_name}"  
</pre>

With a much more readable DSL format:
<pre>
    have_call 'rename_column', [:users, :name, :first_name]
</pre>

I will add this ASAP, so let me know if it's already there and I have forgotten to remove this notice!

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010 Kristian Mandrup. See LICENSE for details.
