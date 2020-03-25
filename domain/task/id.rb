# frozen_string_literal: true

require 'securerandom'

module Task
  class Id < Struct.new(:value)
    class << self
      def generate
        new(SecureRandom.uuid)
      end

      def from_repository(value)
        new(value)
      end
    end

    private_class_method :new

    alias_method :to_s, :value
  end
end
