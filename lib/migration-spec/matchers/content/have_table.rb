module RSpec::RubyContentMatchers  
  def have_create_table(name)
    HaveBlock.new('create_table', :args => ":#{name}")
  end    

  def have_change_table(name)
    HaveBlock.new('change_table', :args => ":#{name}")
  end    
  
  def have_drop_table(name)
    HaveCall.new('drop_table', ":#{name}")
  end

  def have_rename_table(name)
    HaveCall.new('rename_table', ":#{name}")
  end
end
  