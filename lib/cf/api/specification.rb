# frozen_string_literal: true

require "optparse"

module Cf
  module Api
    # Namespace for classes and modules that handle generating openApi documents from Cloud Foundry API source.
    # @since 0.1.0
    module Specification
      class Error < StandardError; end

      params = {}

      OptionParser.new do |parser|
        parser.banner = "Usage: cfas [options]"
        parser.on("-c", "--code CODE", "Location of source code") do |code|
          unless code.nil?
            if Dir.exist?(code)
              puts "Using location #{code}"
              params[code] = code
            else
              puts "Unable to locate source code #{code}"
              exit(1)
            end
          end
        end
        parser.on("-v", "--verbose", "Detailed output")
        parser.on("-h", "--help", "Help message") do
          puts parser
          exit
        end
      end.parse!(into: params)
    end
  end
end
