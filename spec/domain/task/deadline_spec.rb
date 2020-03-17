# frozen_string_literal: true

RSpec.describe Task::Deadline do
  describe '.from_string' do
    it do
      deadline = described_class.new(Date.parse('2020-03-15'))
      expect(deadline.to_s).to eq '2020-03-15'
    end

    context 'given valid string' do
      it do
        from_string = described_class.from_string('2020-01-23')
        from_new = described_class.new(Date.parse('2020-01-23'))
        expect(from_string).to eq(from_new)
      end
    end

    context 'given nil' do
      it do
        expect { described_class.from_string(nil) }.to raise_error(ArgumentError)
      end
    end

    context 'given blank' do
      it do
        expect { described_class.from_string('') }.to raise_error(ArgumentError)
      end
    end

    context 'given invalid format' do
      it do
        expect { described_class.from_string('2020年1月23日') }.to raise_error(ArgumentError)
      end
    end
  end
end
