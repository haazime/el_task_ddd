# frozen_string_literal: true

require 'securerandom'

module Task
  class Id < Struct.new(:value)
    class << self
      def generate
        new(SecureRandom.uuid)
      end
    end

    alias_method :to_s, :value
  end
end
