# frozen_string_literal: true

require "erb"

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
            path = item.gsub("_", "-")
            file_path = File.join(api_output, path)
            Dir.mkdir(file_path) unless File.directory?(file_path)
            operations = Dir.entries(File.join(@location, item)) - %w[. .. _header.md _object.md.erb]
            operations.each do |resource_file|
              template(api_output, path, resource_file) unless resource_file.nil?
            end
          end
        end

        def template(api_output, path, resource_file)
          op = resource_file.sub!(".md.erb", "")
          begin
            use_case = op.gsub("_", "-").sub("-", "")
            use_case_yml = "#{File.join(path, use_case)}.yml"
            puts "Updating: #{use_case_yml}"
            yml_data = ERB.new(File.read("#{Dir.pwd}/templates/OpenAPI-Specification.yml.erb"), trim_mode: "-").result(binding)
            File.open(File.join(api_output, use_case_yml), "w") { |f| f.write yml_data }
          end unless op.nil?
        end
      end
    end
  end
end
