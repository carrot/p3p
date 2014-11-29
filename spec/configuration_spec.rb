require 'spec_helper'

describe P3P::Configuration do
  subject { P3P::Configuration.new }
  let(:default_header) { P3P::Configuration::DEFAULT_HEADER }

  describe '::DEFAULT_HEADER' do
    it 'should contain a default header' do
      expect(default_header).to_not be_nil
    end
  end

  describe '.initialize' do
    it 'should call set_default_header!' do
      # TODO:  Check call over value
      expect(subject.header).to eq default_header
    end
  end

  describe '.set_default_header!' do
    it 'should set the default header' do
      subject.header = 'foo'
      expect(subject.header).to eq 'foo'

      subject.set_default_header!
      expect(subject.header).to eq default_header
    end
  end
end
