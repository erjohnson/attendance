class Term < ActiveRecord::Base
  scope :current_term, -> { where(current_term: true) }

  has_many :users
  has_many :days
  has_many :check_ins, through: :days

  def total_days
    self.days.count
  end

  def total_students
    self.users.count
  end
end
