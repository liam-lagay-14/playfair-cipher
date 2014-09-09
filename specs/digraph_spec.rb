require 'rspec'
require_relative '../lib/Digraph'

describe Digraph do
  let(:valid_digraph) { Digraph.new('CHARLES') }

  let(:valid_digraph_with_letter_j_present) { Digraph.new('LIAMJTEST') }

  let(:valid_digraph_with_multiple_occurrences_of_same_character) { Digraph.new('AADDBBCC') }

  it 'should return the correct keyword' do
    expect(valid_digraph.keyword.keyword).to eq('CHARLES')
  end

  it 'should add the keyword to the digraph' do
    expect(valid_digraph.digraph_array[0]).to eq(%w(C H A R L))
  end

  it 'should return the correct digraph' do
    expect(valid_digraph.digraph_array).to eq([%w(C H A R L), %w(E S B D F), %w(G I K M N), %w(O P Q T U), %w(V W X Y Z)])
  end

  it 'should return the correct digraph with letter j present' do
    expect(valid_digraph_with_letter_j_present.digraph_array).to eq([%w(L I A M I), %w(T E S B C), %w(D F G H K), %w(N O P Q R), %w(U V W X Y)])
  end

  it 'should flatten repeated characters down' do
    expect(valid_digraph_with_multiple_occurrences_of_same_character.digraph_array).
        to eq([%w(A D B C E), %w(F G H I K), %w(L M N O P), %w(Q R S T U), %w(V W X Y Z)])
  end
end