class Term < ActiveRecord::Base
  has_many :users
  has_many :days
  has_many :check_ins, through: :days
end
