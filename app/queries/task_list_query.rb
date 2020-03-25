module TaskListQuery
  Data = Struct.new(:task_id, :content, :description, :status, :priority, :deadline, keyword_init: true)

  class << self
    def call
      Dao::Task.all.map do |record|
        Data.new(
          task_id: record.id,
          content: record.content,
          description: record.description,
          status: Task::Status.from_repository(record.status).to_s,
          priority: Task::Priority.from_repository(record.priority).to_s,
          deadline: record.deadline.to_s,
        )
      end
    end
  end
end
