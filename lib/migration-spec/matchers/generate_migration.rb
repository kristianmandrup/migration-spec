module RSpec::RailsApp::Artifact
  module Matchers
    def generate_migration(name)
      have_migration name
    end
  end   
end
