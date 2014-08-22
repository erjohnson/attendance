class Day < ActiveRecord::Base
  belongs_to :term
  has_many :check_ins
end