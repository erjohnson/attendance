class Term < ActiveRecord::Base
  has_many :users
  has_many :days
  has_many :check_ins, through: :days

  def total_days
    self.days.count
  end
end
