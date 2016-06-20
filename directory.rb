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
def print_header
  puts "-"*50
  puts "The students of Villains Academy".center(50)
  puts "-"*50
end

def print_names(names)
  names.each { |name| puts name }
end

def print_footer(names)
  puts "Overall we have #{names.length} great students"
end

print_header
print_names(students)
print_footer(students)
