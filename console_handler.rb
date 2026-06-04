require_relative 'handler'

class ConsoleHandler < Handler
  def call(event)
    timestamp_str = event.timestamp.strftime('%Y-%m-%d %H:%M')
    puts "[#{timestamp_str}] #{event.type.upcase} \u2014 #{event.description} (#{event.duration} min)"
  end
end
