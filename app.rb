require 'bundler/setup'
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def header
  puts "    Attendance Prototype    "
  puts "============================"
  whitespace
end

def whitespace
  puts "\n"
end

def menu
  puts "    M > Mark Yourself Here"
  puts "    T > New Term"
  case gets.chomp.upcase
  when 'T'
    create_term
  end
end
