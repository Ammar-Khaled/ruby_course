print "How many scores? "
n = gets.to_i

scores = []
for i in 1..n do 
    score = nil
    loop do
        print "Enter score #{i}: " 
        input = gets
        begin
            score = Float(input)
            break if score >= 0 && score <= 100
            puts "enter a number between 0 and 100."
        rescue ArgumentError
            puts "enter a numeric score."
        end
    end
    scores << score
end

average = scores.sum / n
grade = case average
        when 90..100 then 'A'
        when 80...90 then 'B'
        when 70...80 then 'C'
        when 60...70 then 'D'
        else 'F'
        end
highest = scores.max
lowest = scores.min

puts "Results:"
  puts "Average: #{average}"
  puts "Grade: #{grade}"
  puts "Highest: #{highest}"
  puts "Lowest: #{lowest}"