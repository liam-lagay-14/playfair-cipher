require 'rspec'
require_relative '../lib/keyword'

describe Keyword do
  let(:valid_keyword) { Keyword.new('CHARLES') }

  let(:invalid_keyword) { Keyword.new('FAILURETEST123') }

  let(:blank_keyword) { Keyword.new('') }

  let(:keyword_with_multiple_occurrences_of_same_character) { Keyword.new('CHARACTER') }

  it 'takes a string and stores a value' do
     expect(valid_keyword.keyword).to eq('CHARLES')
  end

  it 'removes any repeating characters' do
    expect(keyword_with_multiple_occurrences_of_same_character.keyword).to eq('CHARTE')
  end

  context 'throws ArgumentError if the keyword is invalid' do
    subject { invalid_keyword }

    it { expect { subject}.to raise_error(ArgumentError) }
  end

  context 'raise an argument error if a blank keyword is entered' do
    subject { blank_keyword }

    it { expect { subject }.to raise_error(ArgumentError) }
  end
end