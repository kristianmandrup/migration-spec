module RSpec::RubyContentMatchers    
  def have_remove_tbl_column(tbl_name, col_name)
    have_call 'remove_column', ":#{tbl_name}\s*,\s*:#{col_name}"
  end

  def have_rename_tbl_column(tbl_name, old_name, new_name)
    have_call 'rename_column', ":#{tbl_name}\s*,\s*:#{old_name},\s*:#{new_name}"
  end

  def have_add_tbl_column(tbl_name, col_name, type = 'string')
    have_call 'add_column', ":#{tbl_name}\s*,\s*:#{col_name}\s*,\s*:#{type}"
  end

  def have_change_tbl_column tbl_name, col_name, type='string'
    have_call 'change_column', ":#{tbl_name}\s*,\s*:#{col_name}\s*,\s*:#{type}"
  end
end
