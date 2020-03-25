require 'delegate'

module Task
  class TaskRepository
    class << self
      def add(task)
        raise 'not implemented'
      end

      def find_by_id(task_id)
        raise 'not implemented'
      end
    end
  end
end
