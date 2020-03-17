# frozen_string_literal: true

module Task
  class Task
    attr_reader :id, :content, :description, :status, :priority, :deadline

    class << self
      def from_repository(id:, content:, description:, status:, priority:, deadline:)
        new(
          id: id,
          content: content,
          description: description,
          status: status,
          priority: priority,
          deadline: deadline,
        )
      end
    end

    def initialize(id: nil, content: nil, description: nil, status: nil, priority: nil, deadline: nil)
      @id = id || Id.generate
      @content = content
      @description = description
      @status = status || Status.todo
      @priority = priority || Priority.middle
      @deadline = deadline
    end

    def over_deadline?(date = Date.today)
      @deadline.over?(date)
    end
  end
end
