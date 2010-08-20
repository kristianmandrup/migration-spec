module RSpec::RubyContentMatchers  
  def have_up &block
    have_method 'up', :class, &block
  end  
  alias_method :have_up_method, :have_up

  def have_down &block
    have_method 'down', :class, &block
  end  
  alias_method :have_down_method, :have_down
end




