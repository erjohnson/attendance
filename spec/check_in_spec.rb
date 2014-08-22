require 'spec_helper'

describe CheckIn do
  it { should belong_to :term }
  it { should belong_to :day }
  it { should belong_to :user }
end
