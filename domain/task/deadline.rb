# frozen_string_literal: true

require 'date'

module Task
  class Deadline < Struct.new(:date)
    class << self
      def from_string(string)
        date = Date.parse(string)
      rescue
        raise ArgumentError
      else
        new(Date.parse(string))
      end
    end

    def over?(target_date)
      date < target_date
    end

    def to_s
      date.to_s
    end
  end
end
