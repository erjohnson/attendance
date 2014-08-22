class CheckIn < ActiveRecord::Base
  belongs_to :term
  belongs_to :user
  belongs_to :day
end