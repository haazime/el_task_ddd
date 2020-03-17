# frozen_string_literal: true

RSpec.describe Task::Task do
  describe '初期状態' do
    let(:task) { described_class.new('abc') }

    it do
      expect(task.id).to_not be_nil
    end

    it do
      expect(task.description).to be_nil
    end

    it do
      expect(task.status.to_s).to eq 'todo'
    end

    it do
      expect(task.priority.to_s).to eq 'middle'
    end

    it do
      expect(task.deadline).to be_nil
    end
  end
end
