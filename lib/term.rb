class Term < ActiveRecord::Base
  has_many :users
  has_many :days
  has_many :check_ins, through: :days

  def self.find_current_term
    Term.find_by(current_term: true)
  end

  def total_days
    self.days.count
  end

  def total_students
    self.users.count
  end
end
