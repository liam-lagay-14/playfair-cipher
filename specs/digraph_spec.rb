require 'rspec'
require_relative '../lib/Digraph'

describe Digraph do
  let(:valid_digraph) { Digraph.new('CHARLES') }

  it 'should return the correct keyword' do
    expect(valid_digraph.keyword.keyword).to eq('CHARLES')
  end

  it 'should add the keyword to the digraph' do
    expect(valid_digraph.digraph_array[0]).to eq(%w(C H A R L))
  end

  it 'should return the correct digraph' do
    expect(valid_digraph.digraph_array).to eq([%w(C H A R L), %w(E S B D F), %w(G I K M N), %w(O P Q T U), %w(V W X Y Z)])
  end
end