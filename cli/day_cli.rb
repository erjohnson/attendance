def list_days
  Day.all.each do |day|
    puts "#{day.id} | #{day.created_at.strftime("%m/%d/%Y")}"
  end
  whitespace
end
