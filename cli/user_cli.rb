def users_menu
  header
  puts "        Students        "
  puts "------------------------"
  whitespace
  list_users
  puts "    N > New Student"
  puts "    M > Main Menu"
  case gets.chomp.upcase
  when 'N'
    create_user
  when 'M'
    main_menu
  end
end

def list_users
  User.all.each do |user|
    season = Term.where(id: user.term_id).pluck(:season)
    puts "#{user.id} | #{user.name} | #{season}"
  end
  whitespace
end

def create_user
  header
  puts "    Create New Student    "
  puts "--------------------------"
  whitespace
  puts "Enter the name:"
  name = gets.chomp
  whitespace
  list_terms
  puts "Which term is #{name} attending?"
  puts "Enter the term number:"
  term_num = gets.chomp.to_i
  User.create(name: name, term_id: term_num).valid?
  whitespace
  puts "#{name} has been added!"
  sleep 0.5
  users_menu
end
