def create_term
  header
  puts "    Create New Term    "
  puts "-----------------------"
  whitespace
  puts "Enter the Season & Year:"
  puts "(for example: Winter 2014)"
  season = gets.chomp
  whitespace
  puts "Set Term Start Date"
  puts "Enter the Year (ex: 2012):"
  year = gets.chomp.to_i
  whitespace
  puts "Enter the Month (ex: 10):"
  month = gets.chomp.to_i
  whitespace
  puts "Enter the Day (ex: 7):"
  day = gets.chomp.to_i
  time = Time.new(year, month, day)
  whitespace
  puts "Is #{time} the correct date?"
  puts "Y > Yes"
  puts "N > No"
  case gets.chomp.upcase
  when 'Y'
    term = Term.create(season: season, start: time)
    puts "#{term.season} created!"
    sleep 0.5
    menu
  end
end
