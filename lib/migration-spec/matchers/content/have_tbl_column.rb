module RSpec::RubyContentMatchers    
  def have_remove_tbl_column(tbl_name, col_name)
    HaveCall.new('remove_column', ":#{tbl_name}\s*,\s*:#{col_name}")
  end

  def have_rename_tbl_column(tbl_name, new_name)
    HaveCall.new('rename_column', ":#{tbl_name}\s*,\s*:#{new_name}")
  end

  def have_add_tbl_column(tbl_name, col_name, type = 'string')
    HaveCall.new('add_column', ":#{tbl_name}\s*,\s*:#{col_name}\s*,\s*:#{type}")
  end

  def have_change_tbl_column tbl_name, col_name, type='string'
    HaveCall.new('change_column', ":#{tbl_name}\s*,\s*:#{col_name}\s*,\s*:#{type}")
  end

  def have_add_column(name, type='string')
    HaveCall.new("t.#{type}", ":#{name}")
  end

  def have_change_column(name, type='string')
    HaveCall.new("t.change", ":#{name}\s*,\s*:#{type}")
  end
end
