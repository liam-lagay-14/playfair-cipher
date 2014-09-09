require 'rspec'
require_relative '../lib/Keyword'

describe Keyword do
  let(:valid_keyword) { Keyword.new('CHARLES') }

  let(:invalid_keyword) { Keyword.new('FAILURETEST123') }

  let(:blank_keyword) { Keyword.new('') }

  it 'takes a string and stores a value' do
     expect(valid_keyword.keyword).to eq('CHARLES')
  end

  it 'only allows an uppercase value' do
    expect(valid_keyword.is_valid_keyword?).to eq(true)
  end

  it 'returns false for keywords containing anything except letters' do
    expect(invalid_keyword.is_valid_keyword?).to eq(false)
  end

  context 'raise an argument error if a blank keyword is entered' do
    subject { blank_keyword }

    it { expect { subject }.to raise_error(ArgumentError) }
  end
end