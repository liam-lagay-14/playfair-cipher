require 'rspec'
require_relative '../lib/message'

describe Message do

  let(:valid_message) { Message.new('test message')}

  let(:message_with_odd_character_number) { Message.new('test messag') }

  it 'takes a valid message' do
    expect(valid_message.message).to eq('test message')
  end

  context 'throw an error if a message is not provided' do
    subject { Message.new('') }
    it { expect { subject}.to raise_error(ArgumentError) }
  end
end