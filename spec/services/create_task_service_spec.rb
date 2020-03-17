# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TaskService do
  let(:service) do
    described_class.new(ActiveRecordTaskRepository)
  end

  context '正しいパラメータの場合' do
    it do
      task_id = service.create_task('タスクの内容', deadline: '2020-03-30')

      task = ActiveRecordTaskRepository.find_by_id(task_id)

      aggregate_failures do
        expect(task.id).to eq(task_id)
        expect(task.content).to eq('タスクの内容')
        expect(task.description).to be_nil
        expect(task.status.to_s).to eq('todo')
        expect(task.priority.to_s).to eq('middle')
        expect(task.over_deadline?(Date.parse('2020-03-30'))).to eq false
      end
    end
  end
end
