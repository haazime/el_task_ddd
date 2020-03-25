# frozen_string_literal: true

RSpec.describe Task::Priority do
  describe '.form_integer' do
    it do
      priority = described_class.from_integer(0)
      expect(priority).to eq(described_class.low)
    end

    it do
      priority = described_class.from_integer(1)
      expect(priority).to eq(described_class.middle)
    end

    it do
      priority = described_class.from_integer(2)
      expect(priority).to eq(described_class.high)
    end

    it do
      aggregate_failures do
        expect { described_class.from_integer(-1) }.to raise_error(ArgumentError)
        expect { described_class.from_integer(3) }.to raise_error(ArgumentError)
      end
    end
  end

  describe '.all' do
    it do
      expect(described_class.all).to eq([described_class.low, described_class.middle, described_class.high])
    end
  end
end
