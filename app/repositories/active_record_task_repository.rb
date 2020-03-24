class ActiveRecordTaskRepository < Task::TaskRepository
  class << self
    def add(task)
      Dao::Task.create!(
        id: task.id.to_s,
        content: task.content.to_s,
        description: task.description && task.description.to_s,
        status: task.status.to_i,
        priority: task.priority.to_i,
        deadline: task.deadline.to_s,
      )
    end

    def find_by_id(task_id)
      data = Dao::Task.find(task_id.to_s)

      Task::Task.from_repository(
        id: Task::Id.from_repository(data.id),
        content: data.content,
        description: data.description,
        status: Task::Status.from_repository(data.status),
        priority: Task::Priority.from_repository(data.priority),
        deadline: Task::Deadline.new(data.deadline),
      )
    end
  end
end
