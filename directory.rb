#first we print the list of students
students = [
 "Dr. Hannibal Lecter",
 "Darth Vader",
 "Nurse Ratched",
 "Michael Corleone",
 "Alex Delarge",
 "The Wicked Witch Of The West",
 "Terminator",
 "Freddy Krueger",
 "The Joker",
 "Joffrey Baratheon",
 "Norman Bates",
]

puts "-"*50
puts "The students of Villains Academy".center(50)
puts "-"*50
students.each { |student| puts student }

# finally, we print the total number of students
puts "Overall we have #{students.length} great students"
