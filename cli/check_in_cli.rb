def check_ins_menu
  header
  list_check_ins
end

def list_check_ins
  term = Term.current_term[0]
  day = Day.find_or_create_by(created_at: Time.now.localtime.beginning_of_day, term_id: term.id)
  puts "#{day.created_at.strftime("%m/%d/%Y")}"
  puts "========================"
  day.check_ins.each do |stamp|
      user = User.find_by(id: stamp.user_id)
      puts " #{user.name} - signed in #{stamp.created_at.strftime("at %I:%M%p")} "
  end
  whitespace
  puts "D > View Attendance by Day"
  puts "S > VIew Attendance by Student"
  case gets.chomp.upcase
  when 'D'
    day_check_ins
  when 'S'
    user_check_ins
  end

end

def create_check_in
  header
  puts "Enter your name to sign in:"
  term = Term.current_term[0]
  user = User.find_or_create_by(name: gets.chomp, term_id: term.id)
  t = Time.now()
  day = Day.find_or_create_by(created_at: Time.now.localtime.beginning_of_day, term_id: term.id)
  check_in = CheckIn.create(day_id: day.id, user_id: user.id, term_id: term.id)
  whitespace
  puts "#{user.name} signed in #{check_in.created_at.strftime("at %I:%M%p")}"
  sleep 1
  main_menu
end

def day_check_ins
  header
  list_days
  puts "Enter id of day to view attendance:"
  term = Term.current_term[0]
  day = Day.find_by(id: gets.chomp.to_i, term_id: term.id)
  whitespace
  puts "#{day.created_at.strftime("%m/%d/%Y")}"
  puts "========================"
  day.check_ins.each do |stamp|
      user = User.find_by(id: stamp.user_id)
      puts " #{user.name} - signed in #{stamp.created_at.strftime("at %I:%M%p")} "
  end
  whitespace
end

def user_check_ins
  header
  list_users
  puts "Enter id of a student to view attendance:"
  term = Term.current_term[0]
  user = User.find_by(id: gets.chomp.to_i, term_id: term.id)
  whitespace
  puts "#{user.name} Attendance"
  puts "========================"
  user.check_ins.each do |stamp|
      puts "#{stamp.created_at.strftime("%m/%d/%Y")} signed in #{stamp.created_at.strftime("at %I:%M%p")} "
  end
  whitespace
end
