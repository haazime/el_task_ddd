# frozen_string_literal: true

module Task
  class Status < Struct.new(:value)
    LABELS = {
      0 => 'todo',
      1 => 'doing',
      2 => 'done'
    }

    class << self
      def todo
        new(0)
      end
    end

    def to_s
      LABELS[to_i]
    end

    alias_method :to_i, :value
  end
end
