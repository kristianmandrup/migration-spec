module RSpec::RubyContentMatchers  
  def have_up &block
    HaveMethod.new 'up', :class, &block
  end  
  alias_method :have_up_method, :have_up

  def have_down &block
    HaveMethod.new 'down', :class, &block
  end  
  alias_method :have_down_method, :have_down
end




