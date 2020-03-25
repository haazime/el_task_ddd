# frozen_string_literal: true

module Task
  class Task
    attr_reader :id, :content, :description, :status, :priority, :deadline

    class << self
      def create(content, description: nil, priority: nil, deadline: nil)
        new(
          Id.generate,
          content,
          description,
          Status.todo,
          priority || Priority.middle,
          deadline
        )
      end

      def from_repository(id:, content:, description:, status:, priority:, deadline:)
        new(id, content, description, status, priority, deadline)
      end
    end

    private_class_method :new

    def initialize(id, content, description, status, priority, deadline)
      @id = id
      @content = content
      @description = description
      @status = status
      @priority = priority
      @deadline = deadline
    end

    def over_deadline?(date = Date.today)
      @deadline.over?(date)
    end
  end
end
