# frozen_string_literal: true

require "yaml"
require "erb"
require "fileutils"

module Cf
  module Api
    module Specification
      # System class for directory handling.
      # @since 0.1.0
      class Directories
        def initialize(config, location)
          @filters = YAML.load_file(File.join(config, "filters.yml"))
          @location = location
        end

        def walk(api_output)
          resources = Dir.entries(@location) - @filters["directory_excludes"]
          puts "Updating: #{api_output}"
          resources.each do |item|
            resources(api_output, item) if item.count("_") == 1
          end
          openapi(api_output)
        end

        def openapi(api_output)
          @tags = %w[one]
          @paths = %w[one]
          openapi_yml = File.join(api_output, "openapi.yml")
          yml_data = ERB.new(File.read("#{Dir.pwd}/templates/openapi.yml.erb"), trim_mode: "-").result(binding)
          File.open(openapi_yml, "w") { |f| f.write yml_data }
        end

        def setup_item_path(api_output, directory, item)
          file_name = item.gsub("_resource.go", ".yml")
          root_path = File.join(api_output, directory)
          file_path = File.join(root_path, file_name)
          FileUtils.mkdir_p(file_path) unless File.directory?(file_path)
          file_path
        end

        def resources(api_output, item)
          directory = "resources"
          file_path = setup_item_path(api_output, directory, item)
          puts file_path
          # TODO: Enumerate go package ccv3 and package internal APIRoutes
        end
      end
    end
  end
end
