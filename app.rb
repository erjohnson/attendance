require 'bundler/setup'
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/cli/*.rb'].each { |file| require file }

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def header
  system 'clear'
  puts "Attendance Prototype    "
  puts "============================"
  current_term = Term.find_current_term
  if current_term != nil
    puts "Current Term: #{current_term.season}  "
  end
  whitespace
end

def whitespace
  puts "\n"
end

def main_menu
  header
  puts "    S > Students Menu"
  puts "    T > Terms Menu"
  case gets.chomp.upcase
  when 'S'
    users_menu
  when 'T'
    terms_menu
  end
end

main_menu
