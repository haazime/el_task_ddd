# frozen_string_literal: true

module Task
  class Task
    attr_reader :id, :content, :description, :status, :priority, :deadline

    class << self
      def from_repository(id:, content:, description:, status:, priority:, deadline:)
        new(content, description: description, deadline: deadline).tap do |me|
          me.instance_eval do
            @id = id
            @status = status
            @priority = priority
          end
        end
      end
    end

    def initialize(content, description: nil, priority: nil, deadline: nil)
      @id = Id.generate
      @content = content
      @description = description
      @status = Status.todo
      @priority = priority || Priority.middle
      @deadline = deadline
    end

    def over_deadline?(date = Date.today)
      @deadline.over?(date)
    end
  end
end
