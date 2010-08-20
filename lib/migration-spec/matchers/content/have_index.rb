module RSpec::RubyContentMatchers      
  def have_add_tbl_index(tbl_name, index_name)
    have_call 'add_index', :"#{tbl_name}" + '\s*,\s*' + ":#{index_name}"
  end

  def have_remove_tbl_index(tbl_name, index_name)
    have_call 'remove_index', ":#{tbl_name}" + '\s*,\s*' + ":#{index_name}"
  end

  def have_add_index(name)
    have_call 't.add_index', ":#{name}"
  end
end
