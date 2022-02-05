# frozen_string_literal: true

require "optparse"

require_relative "specification/version"

module Cf
  module Api
    # Namespace for classes and modules that handle generating openApi documents from Cloud Foundry API source.
    # @since 0.1.0
    module Specification
      class Error < StandardError; end

      options = { name: nil, age: nil }

      parser = OptionParser.new do |opts|
        opts.banner = "Usage: specification [options]"
        opts.on("-n", "--code code", "Location of source code") do |name|
          options[:name] = name
        end

        if options[:name].nil?
          print "Enter source code location: "
          options[:name] = gets.chomp
        end

        opts.on("-h", "--help", "Displays Help") do
          puts opts
          exit
        end
      end

      parser.parse!
    end
  end
end
