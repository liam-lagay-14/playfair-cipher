require 'rspec'
require_relative '../lib/Keyword'

describe Keyword do
  let(:valid_keyword) { Keyword.new('CHARLES') }

  it 'takes a string and stores a value' do
     expect(valid_keyword.keyword).to eq('CHARLES')
  end
end