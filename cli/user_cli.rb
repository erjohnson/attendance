def users_menu
  header
  puts "        Students        "
  puts "------------------------"
  whitespace
  list_users
  puts "    N > New Student"
  puts "    R > Remove Student"
  puts "    U > Update Student"
  puts "    M > Main Menu"
  case gets.chomp.upcase
  when 'N'
    create_user
  when 'U'
    update_user
  when 'R'
    delete_user
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

def update_user
  header
  puts "    Update A Student    "
  puts "------------------------"
  whitespace
  list_users
  puts "U > Update Student"
  puts "M > Users Menu"
  case gets.chomp.upcase
  when 'U'
    puts "Enter the number of the student to update:"
    user = User.find_by(id: gets.chomp.to_i)
    whitespace
    puts "N > Change Name"
    puts "T > Change Term"
    case gets.chomp.upcase
    when 'N'
      puts "Enter a new name:"
      user.update(name: gets.chomp)
      update_user
    when 'T'
      puts "Enter a term number:"
      user.update(term_id: gets.chomp.to_i)
      update_user
    end
  when 'M'
    users_menu
  end
end

def delete_user
  header
  puts "    Remove A Student    "
  puts "------------------------"
  whitespace
  list_users
  puts "Enter the number of the student to remove:"
  user = User.find_by(id: gets.chomp.to_i)
  user.destroy
  puts "Student removed!"
  sleep 0.5
  users_menu
end
