require_relative 'event'
require_relative 'event_router'
require_relative 'console_handler'
require_relative 'file_handler'
require_relative 'stats_handler'

class App
  EVENT_TYPES = {
    1 => 'Work',
    2 => 'Study',
    3 => 'Exercise',
    4 => 'Meal'
  }.freeze

  def initialize
    @router = EventRouter.new
    
    # Wire the dependencies here (Strategy Pattern injection)
    @router.register(ConsoleHandler.new)
    @router.register(FileHandler.new)
    @router.register(StatsHandler.new)
  end

  def start
    loop do
      display_menu
      choice = gets.chomp.to_i

      if choice == 5
        break
      elsif EVENT_TYPES.key?(choice)
        log_event(EVENT_TYPES[choice])
      else
        puts "Invalid option. Please try again."
      end
    end
  end

  private

  def display_menu
    puts "\n=== LifeTrack ==="
    puts "1. Log a work session"
    puts "2. Log a study session"
    puts "3. Log an exercise session"
    puts "4. Log a meal"
    puts "5. Exit\n\n"
    print "Choose an option: "
  end

  def log_event(type)
    print "Description: "
    description = gets.chomp

    print "Duration (minutes): "
    duration = gets.chomp.to_i

    event = Event.new(
      type: type,
      description: description,
      duration: duration
    )

    puts "" # Blank line before outputs
    @router.dispatch(event)
    puts "\u2713 Event logged."
  end
end

# Run the app if this file is executed directly
if __FILE__ == $PROGRAM_NAME
  App.new.start
end
