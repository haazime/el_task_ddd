# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TaskListQuery do
  it '要素はタスクの内容を返すこと' do
    service = TaskService.new
    task_id = service.create_task('CONTENT_OF_TASK', description: 'DESC_OF_TASK', deadline: '2020-01-23')

    data = described_class.call.first

    expect(data.task_id).to eq(task_id.to_s)
    expect(data.content).to eq('CONTENT_OF_TASK')
    expect(data.description).to eq('DESC_OF_TASK')
    expect(data.status).to eq('todo')
    expect(data.priority).to eq('middle')
    expect(data.deadline.to_s).to eq('2020-01-23')
  end

  context 'タスクがない場合' do
    it do
      list = described_class.call

      expect(list).to be_empty
    end
  end

  context 'タスクがある場合' do
    it do
      service = TaskService.new
      task_a_id = service.create_task('タスクAAA')
      task_b_id = service.create_task('タスクBBB')
      task_c_id = service.create_task('タスクCCC')

      list = described_class.call

      expect(list[0].task_id).to eq(task_a_id.to_s)
      expect(list[1].task_id).to eq(task_b_id.to_s)
      expect(list[2].task_id).to eq(task_c_id.to_s)
    end
  end
end
