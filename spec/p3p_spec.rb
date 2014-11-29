require 'spec_helper'

describe P3P do
  describe '#configuration' do
    subject { P3P.configuration }

    it 'should instantiate P3P::Configuration' do
      expect(subject.class).to eq P3P::Configuration
    end

    it 'should memoize P3P::Configuration' do
      expect(subject).to eq P3P.configuration
    end
  end

  describe '#configure' do
    it 'should yield :configuration' do
      expect { |b| P3P.configure(&b) }.to yield_control
    end
  end
end
