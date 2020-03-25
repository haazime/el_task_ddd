# frozen_string_literal: true

module Task
  class Priority < Struct.new(:value)
    LABELS = {
      0 => 'low',
      1 => 'middle',
      2 => 'high',
    }

    class << self
      def low
        new(0)
      end

      def middle
        new(1)
      end

      def high
        new(2)
      end

      def all
        [low, middle, high]
      end

      def from_integer(value)
        raise ArgumentError unless LABELS.keys.include?(value)
        new(value)
      end

      def from_repository(value)
        new(value)
      end
    end

    private_class_method :new

    def to_s
      LABELS[to_i]
    end

    alias_method :to_i, :value
  end
end
