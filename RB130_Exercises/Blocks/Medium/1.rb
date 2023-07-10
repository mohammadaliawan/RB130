class Device
  def initialize
    @recordings = []
  end

  def play
    puts @recordings.last
  end

  def listen
    if block_given?
      record(yield)
    end
  end

  def record(recording)
    @recordings << recording
  end
end


listener = Device.new
# listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"