class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.belongs_to :term
      t.timestamps
    end
    
    create_table :terms do |t|
      t.string :season
      t.datetime :start
      t.datetime :end
    end
    
    create_table :days do |t|
      t.belongs_to :term
      t.timestamps
    end
    
    create_table :check_ins do |t|
      t.belongs_to :day
      t.belongs_to :user
      t.belongs_to :term
      t.boolean :late
      t.timestamps
    end
  end
end
