require 'csv'
@students = []
@filename = 'students.csv'

def input_students
  name = get_name
  while !name.empty? do
    name = name_spell_check(name)
    cohort = get_cohort
    country = get_country
    @students << {name: name, cohort: cohort, country: country}
    if @students.count == 1
      puts "Now we have #{@students.count} student."
    else
      puts "Now we have #{@students.count} students."
    end
    puts "Please enter next students name or hit enter to end."
    name = STDIN.gets.chomp
  end
  no_students
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list"
  puts "4. Load the students"
  puts "9. Exit"
end

def get_name
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
end

def name_spell_check(name)
  puts "You input '#{name}' is this correct? (y/n)"
  spell = STDIN.gets.chomp.downcase
  while spell == "n"
    puts "Please enter the correct spelling:"
    name = STDIN.gets.chomp
    puts "You input '#{name}' is this correct? (y/n)"
    spell = STDIN.gets.chomp.downcase
  end
  name
end

def get_cohort
  puts "Please enter the students cohort"
  cohort = STDIN.gets.chomp
  if cohort.empty?
    cohort = "July".to_sym
  end
  cohort
end

def get_country
  puts "Please enter the students birth country"
  country = STDIN.gets.chomp
  while country.empty? do
    puts "You must enter a country of birth"
    country = STDIN.gets.chomp
  end
  country
end

def show_students
  print_header
  print_names
  print_footer
end

def no_students
  if @students.count < 1
    puts "-"*50
    puts "No students were entered. Quitting program".center(50)
    puts '-'*50
    exit
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      puts "Now showing students"
      show_students
    when "3"
      save_students
      puts ""
      puts "3 selected - Students saved"
      puts
    when "4"
      load_students
      puts
      puts "4 selected - Students loaded"
      puts
    when "9"
      "Bye"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def print_header
  puts "-"*50
  puts "The students of Villains Academy".center(50)
  puts "-"*50
end

def print_names
  cohort_sorted = @students.group_by {|e| e[:cohort]}
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

def print_footer
  puts "Overall we #{@students.length} great students"
end

def save_students
  CSV.open(set_filename, 'w') do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  end
end

def set_filename
  puts "Please enter filename: "
  @filename = STDIN.gets.chomp + '.csv'
end

def load_students(filename = set_filename)
  CSV.foreach(filename,'r') do |f|
    name, cohort = f
    @students << {name: name, cohort: cohort.to_sym}
  end
end

def default_load
  CSV.foreach('students.csv','r') do |f|
    name, cohort = f
    @students << {name: name, cohort: cohort.to_sym}
  end
end

def try_load_students
  filename = ARGV.first
  return load_students(@filename) if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry #{filename} doesn't not exist"
    exit
  end
end

#load_students
# #puts ARGV.inspect
try_load_students
interactive_menu
