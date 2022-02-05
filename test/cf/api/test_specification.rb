# frozen_string_literal: true

require "test_helper"

module Cf
  module Api
    class TestSpecification < Minitest::Test
      def test_that_it_has_a_version_number
        refute_nil ::Cf::Api::Specification::VERSION
      end
    end
  end
end
