# frozen_string_literal: true

require "yaml"
require "erb"
require "fileutils"

module Cf
  module Api
    module Specification
      # System class for enumerating go source code.
      # @since 0.1.0
      class Enumerate
        def initialize(config, generated, location)
          @config = config
          @generated = generated
          @location = location
          @input = File.join(@location, "api/cloudcontroller/ccv3")
          @output = File.join(@generated, "resources")
          @filters = YAML.load_file(File.join(@config, "filters.yml"))
        end

        def to_api_paths(feature)
          feature_file = File.join(@input, feature)
          puts "Enumerating resources from: #{feature_file}"
          File.foreach(feature_file) do |line|
            begin
              puts line
            end if line.include? "RequestName:"
          end if File.exist?(feature_file)
        end
      end
    end
  end
end
