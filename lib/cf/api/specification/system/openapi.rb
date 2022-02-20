# frozen_string_literal: true

require "yaml"
require "erb"
require "fileutils"

module Cf
  module Api
    module Specification
      # System class for generating openapi spec.
      # @since 0.1.0
      class OpenAPi
        def initialize(config, location)
          @base = "generated"
          @filters = YAML.load_file(File.join(config, "filters.yml"))
          @location = location
        end

        def generate(api_output)
          @tags = %w[one]
          @paths = %w[one]
          openapi_yml = File.join(api_output, "openapi.yml")
          yml_data = ERB.new(File.read("#{Dir.pwd}/templates/openapi.yml.erb"), trim_mode: "-").result(binding)
          File.open(openapi_yml, "w") { |f| f.write yml_data }
        end
      end
    end
  end
end
