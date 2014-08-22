def terms_menu
  header
  puts "         Terms         "
  puts "-----------------------"
  whitespace
  list_terms
  puts "N > New Term"
  puts "M > Main Menu"
  case gets.chomp.upcase
  when 'N'
    create_term
  when 'M'
    main_menu
  end
end

def list_terms
  Term.all.each do |term|
    puts "#{term.id} | #{term.season} | #{term.start_date.strftime("%m/%d/%Y")} to #{term.end_date.strftime("%m/%d/%Y")} | Length: #{term.total_days} days | #{term.total_students} students"
  end
  whitespace
end

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
  start_year = gets.chomp.to_i
  whitespace
  puts "Enter the Month (ex: 10):"
  start_month = gets.chomp.to_i
  whitespace
  puts "Enter the Day (ex: 7):"
  start_day = gets.chomp.to_i
  start_date = Time.new(start_year, start_month, start_day)
  whitespace
  puts "Set Term End Date"
  puts "Enter the Year (ex: 2012):"
  end_year = gets.chomp.to_i
  whitespace
  puts "Enter the Month (ex: 10):"
  end_month = gets.chomp.to_i
  whitespace
  puts "Enter the Day (ex: 7):"
  end_day = gets.chomp.to_i
  end_date = Time.new(end_year, end_month, end_day)
  whitespace
  puts "Is #{start_date} to #{end_date} the correct date range?"
  puts "Y > Yes"
  puts "N > No"
  case gets.chomp.upcase
  when 'Y'
    term = Term.new(season: season, start_date: start_date, end_date: end_date)
    puts "#{term.season} created!"
    whitespace
    sleep 0.5
    puts "Do you want to set #{term.season} as the current term?"
    puts "Y > Yes"
    puts "N > No"
    case gets.chomp.upcase
    when 'Y'
      term.current_term = true
      term.save
      terms_menu
    when 'N'
      term.save
      terms_menu
    end
  when 'N'
    create_term
  end
end
