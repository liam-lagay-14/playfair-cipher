require 'rspec'
require_relative '../lib/message'

describe Message do

  let(:valid_message) { Message.new('test message')}

  let(:message_with_odd_character_number) { Message.new('test messag') }

  it 'takes a valid message' do
    expect(valid_message.message).to eq('test message')

    ##expect(valid_message.message_pairs).to eq([%w(T E), %w(S T), %w(M E), %w(S X), %w(S A), %w(G E)])
  end

  #it 'should append an X to the end of the string if there are an odd number of characters' do
    #expect(message_with_odd_character_number.message_pairs).to eq([%w(T E), %w(S T), %w(M E), %w(S X), %w(S A), %w(G X)])
  #end

  context 'throw an error if a message is not provided' do
    subject { Message.new('') }
    it { expect { subject}.to raise_error(ArgumentError) }
  end
end