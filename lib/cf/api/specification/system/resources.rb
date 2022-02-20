# frozen_string_literal: true

require "yaml"
require "erb"
require "fileutils"

module Cf
  module Api
    module Specification
      # System class for generated resource handling.
      # @since 0.1.0
      class Resources
        def initialize(config, generated, location)
          @config = config
          @generated = generated
          @location = location
          @input = File.join(@location, "resources")
          @output = File.join(@generated, "resources")
          @filters = YAML.load_file(File.join(@config, "filters.yml"))
          FileUtils.mkdir_p(@output) unless File.directory?(@output)
        end

        def walk
          puts "Walking resources from: #{@input}"
          resources = {}
          sources = Dir.entries(@input) - @filters["directory_excludes"]
          sources.each do |resource|
            resources[to_yml(resource)] = setup_resource_path(resource) if resource.count("_") == 1
          end
          resources
        end

        def to_yml(resource)
          resource.gsub("_resource.go", ".yml")
        end

        def to_feature(resource)
          resource.gsub("_resource", "")
        end

        def setup_resource_path(resource)
          @resource = resource
          @feature = to_feature(resource)
          file_name = to_yml(@resource)
          file_path = File.join(@output, file_name)
          yml_data = ERB.new(File.read("#{Dir.pwd}/templates/resource.yml.erb"), trim_mode: "-").result(binding)
          File.open(file_path, "w") { |f| f.write yml_data }
          file_path
        end
      end
    end
  end
end
