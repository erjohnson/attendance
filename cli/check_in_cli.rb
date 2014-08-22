def create_check_in
  header
  puts "Enter your name to sign in:"
  term = Term.find_current_term
  user = User.find_or_create_by(name: gets.chomp, term_id: term.id)
  day = Day.create(term_id: term.id)
  check_in = CheckIn.create(day_id: day.id, user_id: user.id, term_id: term.id)
  whitespace
  puts "#{user.name} signed in #{check_in.created_at.strftime("at %I:%M%p")}"
  sleep 1
  main_menu
end
