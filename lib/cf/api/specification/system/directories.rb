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
            operations = Dir.entries(File.join(@location, item)) - @filters["operations_excludes"]
            operations_limited = operations.select { |s| s.scan(/_/).length <= 1 }
            operations_limited.each do |file|
              resources(api_output, item, file) unless file.nil?
            end
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
          file_name = item.gsub("_", "-")
          root_path = File.join(api_output, directory)
          file_path = File.join(root_path, file_name)
          FileUtils.mkdir_p(file_path) unless File.directory?(file_path)
          file_path
        end

        def resources(api_output, item, file)
          directory = "resources"
          file_path = setup_item_path(api_output, directory, item)
          operation = file.sub!(".md.erb", "")
          begin
            use_case = operation.gsub("_", "-").sub("-", "")
            use_case_yml = "#{File.join(file_path, use_case)}.yml"
            puts "Updating: #{use_case_yml}"
            @entries = %w[get post delete]
            yml_data = ERB.new(File.read("#{Dir.pwd}/templates/resources.yml.erb"), trim_mode: "-").result(binding)
            File.open(use_case_yml, "w") { |f| f.write yml_data }
          end unless operation.nil?
        end
      end
    end
  end
end
