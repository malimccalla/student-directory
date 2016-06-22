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
  name = gets.delete("\n")
  while !name.empty? do
    puts "You input '#{name}' is this correct? (y/n)"
    spell = gets.delete("\n").downcase
    while spell == "n"
      puts "Please enter the correct spelling:"
      name = gets.delete("\n")
      puts "You input '#{name}' is this correct? (y/n)"
      spell = gets.delete("\n").downcase
    end
    puts "Please enter the students cohort"
    cohort = gets.delete("\n")
    if cohort.empty?
      cohort = "July".to_sym
    end
    puts "Please enter the students birth country"
    country = gets.delete("\n")
    while country.empty? do
      puts "You must enter a country of birth"
      country = gets.delete("\n")
    end
    students << {name: name, cohort: cohort, country: country}
    if students.count == 1
      puts "Now we have #{students.count} student."
    else
      puts "Now we have #{students.count} students."
    end
    puts "Please enter next students name or hit enter to end."
    name = gets.delete("\n")
  end
  if students.count < 1
    puts "-"*50
    puts "No students were entered. Quitting program".center(50)
    puts '-'*50
    exit
  else
    students
  end
end

def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"

    selection = gets.chomp
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print_names(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what you mean, try again."
    end
  end

end


def print_header
  puts "-"*50
  puts "The students of Villains Academy".center(50)
  puts "-"*50
end

def print_names(students)
  cohort_sorted = students.group_by {|e| e[:cohort]}
  cohort_sorted.each do |k,v|
    puts '-'*50
    puts "#{k}: ".center(50)
    puts ''
    v.each do |student|
      puts "#{student[:name]}"
      puts ''
    end
  end
end

def print_footer(students)
  puts "Overall we #{students.length} great students"
end

interactive_menu
