# frozen_string_literal: true

require "erb"
require "fileutils"

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
            operations = Dir.entries(File.join(@location, item)) - %w[. .. _header.md _object.md.erb]
            operations.each do |file|
              resources(api_output, item, file) unless file.nil?
            end
          end
        end

        def setup_path(api_output, directory, item)
          file_name = item.gsub("_", "-")
          root_path = File.join(api_output, directory)
          file_path = File.join(root_path, file_name)
          FileUtils.mkdir_p(file_path) unless File.directory?(file_path)
          file_path
        end

        def resources(api_output, item, resource_file)
          directory = "resources"
          file_path = setup_path(api_output, directory, item)
          operation = resource_file.sub!(".md.erb", "")
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
