require 'spec_helper'

describe Term do
  it { should have_many :users }
  it { should have_many :days }
  it { should have_many :check_ins }

  describe '.find_current_term' do
    it 'returns the current term' do
      term1 = Term.create(season: 'Spring 2014')
      term2 = Term.create(season: 'Summer 2014', current_term: true)
      expect(Term.find_current_term).to eq term2
    end
  end

  describe 'total_days' do
    it 'returns the total number of days' do
      term = Term.create(season: 'Spring 2014')
      day = Day.create(term_id: term.id)
      expect(term.total_days).to eq 1
    end
  end

  describe 'total_students' do
    it 'returns the total number of students' do
      term = Term.create(season: 'Spring 2014')
      user = User.create(name: 'Joe', term_id: term.id)
      expect(term.total_students).to eq 1
    end
  end
end
