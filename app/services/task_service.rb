# frozen_string_literal: true

class TaskService

  def initialize(task_repository)
    @task_repository = task_repository
  end

  def create_task(content, deadline: nil)
    deadline = Task::Deadline.from_string(deadline)
    task = Task::Task.new(content, deadline: deadline)
    @task_repository.add(task)
    task.id
  end
end
