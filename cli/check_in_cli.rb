def check_ins_menu
  header
  list_check_ins
end

def list_check_ins
  Day.all.each do |day|
    puts "#{day.created_at.strftime("%m/%d/%Y")}"
    puts "========================"
    day.check_ins.each do |stamp|
      user = User.find_by(id: stamp.user_id)
      puts " #{user.name} - signed in #{stamp.created_at.strftime("at %I:%M%p")} "
    end
  end
  whitespace
end

def create_check_in
  header
  puts "Enter your name to sign in:"
  term = Term.find_current_term
  user = User.find_or_create_by(name: gets.chomp, term_id: term.id)
  t = Time.now()
  day = Day.find_or_create_by(created_at: Time.new(t.year, t.month, t.day), term_id: term.id)
  check_in = CheckIn.create(day_id: day.id, user_id: user.id, term_id: term.id)
  whitespace
  puts "#{user.name} signed in #{check_in.created_at.strftime("at %I:%M%p")}"
  sleep 1
  main_menu
end
