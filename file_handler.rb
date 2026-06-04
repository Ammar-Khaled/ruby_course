require_relative 'handler'

class FileHandler < Handler
  def initialize(file_path = 'lifetrack.log')
    @file_path = file_path
  end

  def call(event)
    timestamp_str = event.timestamp.strftime('%Y-%m-%d %H:%M')
    log_line = "[#{timestamp_str}] #{event.type.upcase} \u2014 #{event.description} (#{event.duration} min)\n"
    File.write(@file_path, log_line, mode: 'a')
  end
end
