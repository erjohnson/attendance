class ChangeTermColumnNames < ActiveRecord::Migration
  def change
    rename_column :terms, :start, :start_date
    rename_column :terms, :end, :end_date
  end
end
