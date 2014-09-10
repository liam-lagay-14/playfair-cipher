class Message
  attr_accessor :message

  def initialize(message)
    @message = message
    raise ArgumentError, 'Message must be provided' if message.empty?
  end
end