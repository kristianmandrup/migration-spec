module RSpec::RubyContentMatchers   
  module ActiveRecord
    module Migration 
      def have_remove_column(name)
        have_call 't.remove', ":#{name}"
      end

      def have_add_column(name, type='string')
        have_call "t.#{type}", ":#{name}"
      end
      alias_method :have_column, :have_add_column

      def have_columns(columns = {})
        raise ArgumentError, "Columns must be passed as a :name => :type Hash" if !columns.kind_of? Hash
        col_hash = {}
        columns.each_pair do |name, type|
          method_call = "t.#{type}"
          arg = ":#{name}"       
          col_hash[method_call] = arg
        end
        HaveCalls.new col_hash
      end

      def have_change_column(name, type='string')
        have_call "t.change", ":#{name}\s*,\s*:#{type}"
      end

      def have_timestamps
        have_call "t.timestamps"
      end
    end
  end
end
