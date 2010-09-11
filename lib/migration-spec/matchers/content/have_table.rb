module RSpec::RubyContentMatchers  
  def have_create_table(name)
    have_block 'create_table', :args => ":#{name}"
  end    

  def have_change_table(name)
    have_block 'change_table', :args => ":#{name}"
  end    
  
  def have_drop_table(name)
    have_call 'drop_table', ":#{name}"
  end

  def have_rename_table(name)
    have_call 'rename_table', ":#{name}"
  end
end
  