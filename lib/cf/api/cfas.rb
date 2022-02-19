# frozen_string_literal: true

require "optparse"

require_relative "specification/system"

module Cf
  module Api
    module Specification
      # Namespace for classes and modules that handle generating openApi documents from Cloud Foundry API source.
      # @since 0.1.0
      class Cfas
        def self.parse(args)
          OptionParser.new do |parser|
            parser.banner = "Usage: cfas [options]"
            parser.on("-L", "--location LOCATION", "Location of source code") do |location|
              unless location.nil?
                if Dir.exist?(location)
                  resource_location = "#{location}/resources"
                  puts "Resources: #{resource_location}"
                  @location = resource_location
                else
                  puts "Unable to locate source code #{location}"
                  exit(1)
                end
              end
            end
            parser.on("-h", "--help", "Help message") do
              puts parser
              exit
            end
          end.parse(args)
        end

        def self.walk(api_config, api_output)
          Api::Specification::Directories.new(api_config, @location).walk(api_output)
        end
      end
    end
  end
end
