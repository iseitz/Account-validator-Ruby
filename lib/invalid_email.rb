class InvalidEmail < StandardError
  attr_reader :message

  def initialize (message)
    @message = message
  end
end
