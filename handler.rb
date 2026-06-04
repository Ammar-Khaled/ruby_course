class Handler
  def call(event)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
