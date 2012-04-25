class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, :default => true
      t.boolean :active, :default => true
      
      t.timestamps
    end
  end
end
