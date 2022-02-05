# frozen_string_literal: true

module Cf
  module Api
    module Specification
      # System class for directory handling.
      # @since 0.1.0
      class Directories
        def initialize(location)
          @location = location
        end

        def walk(api_output)
          resources = Dir.entries(@location) - %w[. .. _header.md admin app_features app_usage_events builds buildpacks environment_variable_groups]
          puts "Updating: #{api_output}"
          resources.each do |item|
            file_path = File.join(api_output, item)
            Dir.mkdir(file_path) unless File.directory?(file_path)
          end
        end
      end
    end
  end
end
