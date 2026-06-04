require_relative 'handler'

class StatsHandler < Handler
  def initialize
    @events = []
    
    # Register the automatic exit hook to print stats when the program finishes
    at_exit { print_stats }
  end

  def call(event)
    @events << event
  end

  private

  def print_stats
    puts "\n=== Session Statistics ==="
    puts "Total Events Logged: #{@events.size}"
    
    total_duration = @events.sum(&:duration)
    puts "Total Duration: #{total_duration} minutes"
    
    if @events.any?
      puts "Breakdown by Type:"
      type_counts = @events.group_by(&:type).transform_values(&:count)
      type_counts.each do |type, count|
        puts "  - #{type}: #{count} event(s)"
      end
    end
    puts "=========================="
  end
end
