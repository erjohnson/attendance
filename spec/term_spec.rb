require 'spec_helper'

describe Term do
  it { should have_many :users }
  it { should have_many :days }
  it { should have_many :check_ins }

  describe '.total_days' do
    it 'returns the total number of days' do
      term = Term.create(season: 'Spring 2014')
      day = Day.create(term_id: term.id)
      expect(term.total_days).to eq 1
    end
  end
end
