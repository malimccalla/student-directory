#first we print the list of students
students = [
 {name: "Dr. Hannibal Lecter", cohort: :november},
 {name: "Darth Vader", cohort: :november},
 {name: "Nurse Ratched", cohort: :november},
 {name: "Michael Corleone", cohort: :november},
 {name: "Alex Delarge", cohort: :november},
 {name: "The Wicked Witch Of The West", cohort: :november},
 {name: "Terminator", cohort: :november},
 {name: "Freddy Krueger", cohort: :november},
 {name: "The Joker", cohort: :november},
 {name: "Joffrey Baratheon", cohort: :november},
 {name: "Norman Bates", cohort: :november},
]

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "-"*50
  puts "The students of Villains Academy".center(50)
  puts "-"*50
end

def print_names(students)
  @filtered = []
  students.each_with_index do |student, index|
    if student[:name].length < 12
      @filtered << "#{index+1}.#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
  puts @filtered
end

def print_footer(students)
  puts "We have #{@filtered.length} students whose names are longer than 12 and #{students.length} students overall"
end

students = input_students
print_header
print_names(students)
print_footer(students)
