class AddCurrentTermToTerms < ActiveRecord::Migration
  def change
    add_column :terms, :current_term, :boolean
  end
end
