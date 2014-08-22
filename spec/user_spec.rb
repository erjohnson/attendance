require 'spec_helper'

describe User do
  it { should belong_to :term }
  it { should have_many :days }
end