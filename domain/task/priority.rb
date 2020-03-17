# frozen_string_literal: true

module Task
  class Priority < Struct.new(:value)
    LABELS = {
      0 => 'low',
      1 => 'middle',
      2 => 'high',
    }

    class << self
      def middle
        new(1)
      end
    end

    def to_s
      LABELS[to_i]
    end

    alias_method :to_i, :value
  end
end
