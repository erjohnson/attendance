class Day < ActiveRecord::Base
  belongs_to :term
  has_many :check_ins
  has_many :users, through: :check_ins
end
