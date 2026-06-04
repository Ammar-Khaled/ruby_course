class EventRouter
  def initialize
    @handlers = []
  end

  def register(handler)
    # Basic duck-typing check (optional but good for debugging)
    unless handler.respond_to?(:call)
      raise ArgumentError, "Handler must implement a #call(event) method"
    end
    
    @handlers << handler
  end

  def dispatch(event)
    @handlers.each do |handler|
      handler.call(event)
    end
  end
end
