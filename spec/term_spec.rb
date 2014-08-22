require 'spec_helper'

describe Term do
  it { should have_many :users }
  it { should have_many :days }
  it { should have_many :check_ins }
end
