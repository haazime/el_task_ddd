# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TaskListQuery do
  let(:usecase) { CreateTaskUsecase.new }

  it '要素はタスクの内容を返すこと' do
    task_id = usecase.run('CONTENT_OF_TASK', description: 'DESC_OF_TASK', deadline: '2020-01-23')

    data = described_class.call.first

    aggregate_failures do
      expect(data.task_id).to eq(task_id.to_s)
      expect(data.content).to eq('CONTENT_OF_TASK')
      expect(data.description).to eq('DESC_OF_TASK')
      expect(data.status).to eq('todo')
      expect(data.priority).to eq('middle')
      expect(data.deadline.to_s).to eq('2020-01-23')
    end
  end

  context 'タスクがない場合' do
    it do
      list = described_class.call

      expect(list).to be_empty
    end
  end

  context 'タスクがある場合' do
    it do
      task_a_id = usecase.run('タスクAAA')
      task_b_id = usecase.run('タスクBBB')
      task_c_id = usecase.run('タスクCCC')

      list = described_class.call

      expect(list[0].task_id).to eq(task_a_id.to_s)
      expect(list[1].task_id).to eq(task_b_id.to_s)
      expect(list[2].task_id).to eq(task_c_id.to_s)
    end
  end
end
