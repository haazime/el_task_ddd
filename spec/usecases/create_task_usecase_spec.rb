# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateTaskUsecase do
  let(:service) do
    described_class.new(ActiveRecordTaskRepository)
  end

  it do
    task_id = service.run(
      'タスクの内容',
      description: 'タスクの説明',
      priority: '2',
      deadline: '2020-03-30'
    )

    task = ActiveRecordTaskRepository.find_by_id(task_id)

    aggregate_failures do
      expect(task.id).to eq(task_id)
      expect(task.content).to eq('タスクの内容')
      expect(task.description).to eq('タスクの説明')
      expect(task.status).to eq(Task::Status.todo)
      expect(task.priority).to eq(Task::Priority.high)
      expect(task.over_deadline?(Date.parse('2020-03-30'))).to be false
    end
  end
end
