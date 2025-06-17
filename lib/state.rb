# frozen_string_literal: true

# state.rb
require 'yaml'

class State # rubocop:disable Style/Documentation
  SAVE_FILE = 'save.yml'

  def self.save(game)
    File.open(SAVE_FILE, 'w') { |file| file.write(YAML.dump(game)) }
  end

  def self.load
    return nil unless File.exist?(SAVE_FILE)

    YAML.unsafe_load_file(SAVE_FILE)
  end
end
