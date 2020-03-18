# frozen_string_literal: true

class CreateTaskUsecase

  def initialize(task_repository = ActiveRecordTaskRepository)
    @task_repository = task_repository
  end

  def run(content, description: nil, deadline: nil)
    if deadline
      deadline = Task::Deadline.from_string(deadline)
    end

    task = Task::Task.new(content, description: description, deadline: deadline)
    @task_repository.add(task)
    task.id
  end
end
