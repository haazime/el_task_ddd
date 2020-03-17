# frozen_string_literal: true

RSpec.describe CreateTaskForm do
  let(:valid) do
    {
      content: 'Task AAA',
      description: 'Task Description',
      deadline: '2020-03-17',
    }
  end

  context '正しいパラメータの場合' do
    it do
      form = described_class.new(valid)
      expect(form).to be_valid
    end

    it do
      form = described_class.new(valid.merge(description: ''))
      expect(form).to be_valid
    end

    it do
      form = described_class.new(valid.merge(deadline: ''))
      expect(form).to be_valid
    end
  end

  context '不正なパラメータの場合' do
    context '内容が空白' do
      it do
        form = described_class.new(valid.merge(content: ''))

        expect(form).to_not be_valid
        expect(form.errors[:content]).to include(i18n_error(:blank))
      end
    end

    context '期限が不正な値' do
      it do
        form = described_class.new(valid.merge(deadline: '12345'))

        expect(form).to_not be_valid
        expect(form.errors[:deadline]).to include(i18n_error(:invalid_date))
      end
    end
  end

  describe '#description' do
    it do
      form = described_class.new(valid.merge(description: ''))

      expect(form.description).to be_nil
    end
  end

  describe '#deadline' do
    it do
      form = described_class.new(valid.merge(deadline: ''))

      expect(form.deadline).to be_nil
    end
  end
end
