# frozen_string_literal: true

class CreateTaskUsecase

  def initialize(task_repository = ActiveRecordTaskRepository)
    @task_repository = task_repository
  end

  def run(content, description: nil, priority: nil, deadline: nil)
    if priority
      priority = Task::Priority.from_integer(priority.to_i)
    end

    if deadline
      deadline = Task::Deadline.from_string(deadline)
    end

    task = Task::Task.new(content, description: description, priority: priority, deadline: deadline)
    @task_repository.add(task)
    task.id
  end
end
