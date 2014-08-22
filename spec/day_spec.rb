require 'spec_helper'

describe Day do
  it { should belong_to :term }
  it { should have_many :check_ins }
  it { should have_many :users }
end
