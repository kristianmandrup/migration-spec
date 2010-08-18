module RSpec::RubyContentMatchers    
  def have_add_tbl_index(tbl_name, index_name)
    HaveCall.new('add_index', ":#{tbl_name}\s*,\s*:#{index_name}")
  end

  def have_remove_index(name)
    HaveCall.new('remove_index', ":#{tbl_name}\s*,\s*:#{index_name}")
  end
end
