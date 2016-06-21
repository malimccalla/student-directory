#first we print the list of students

# students = [
#  {name: "Dr. Hannibal Lecter", cohort: :november},
#  {name: "Darth Vader", cohort: :november},
#  {name: "Nurse Ratched", cohort: :november},
#  {name: "Michael Corleone", cohort: :november},
#  {name: "Alex Delarge", cohort: :november},
#  {name: "The Wicked Witch Of The West", cohort: :november},
#  {name: "Terminator", cohort: :november},
#  {name: "Freddy Krueger", cohort: :november},
#  {name: "The Joker", cohort: :november},
#  {name: "Joffrey Baratheon", cohort: :november},
#  {name: "Norman Bates", cohort: :november},
# ]

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    puts "Please enter the students cohort"
    cohort = gets.chomp
    while cohort.empty? do
      puts "You must enter a cohort: "
      cohort = gets.chomp
    end
    puts "Please enter the students birth country"
    country = gets.chomp
    while country.empty? do
      puts "You must enter a country of birth"
      country = gets.chomp
    end
    students << {name: name, cohort: cohort, country: country}
    puts "Now we have #{students.count} students"
    puts "Please enter next students name or hit enter to end."
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
  index = 0
  while index < students.length
    puts "#{index+1}.#{students[index][:name]} (#{students[index][:cohort]}). Country of birth: #{students[index][:country]}"
    index += 1
  end
end

def print_footer(students)
  puts "Overall we #{students.length} great students"
end

students = input_students
print_header
print_names(students)
print_footer(students)
