module RSpec
  module FileMatchers
    class GenerateMigration
      # include Rails::Assist::Generators::MigrationHelper

      include Rails::Assist::Migration

      attr_reader :name

      def initialize(name)
        @name = name.to_s
      end

      def matches?(generator)
        expected = migration_file_name(name, generator)
        if block_given? && expected
          read = File.read(expected)
          ruby_content = read.extend(RSpec::RubyContent::Helpers)
          yield ruby_content
        else
          expected
        end
      end          
    
      def failure_message
        "Expected migration #{name} to have been generated, but it was not"
      end

      def negative_failure_message
        "Did not expect migration #{name} to have been generated, but it was"
      end
      
      protected

      # # Use migration-spec ?
      # 
      # def migration_file_name(relative, generator) #:nodoc:
      #   dirname = migration_dir
      #   file_name = relative.sub(/\.rb$/, '')
      #   migrations = Dir.glob("#{dirname}/[0-9]*_*.rb")
      #   !migrations.empty? ? migrations.grep(/\d+_#{file_name}\.rb$/).first : false
      # end
      
    end
  
    def generate_migration(name)
      GenerateMigration.new(name)
    end
    alias_method :have_migration, :generate_migration  
  end   
end
