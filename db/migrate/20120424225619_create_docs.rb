class CreateDocs < ActiveRecord::Migration
  def change
    create_table :docs do |t|
      t.string :case_key, :null => false
      t.string :docket_number, :null => false
      t.integer :document_number, :null => false
      t.integer :team_id, :null => false
      t.integer :status, :null => false, :default => Doc::TODO
      t.integer :flag, :null => false, :default => Doc::NO_FLAG
      t.integer :last_touched_admin_id
      t.timestamp :last_touched_admin_time
      t.integer :last_touched_supervisor_id
      t.timestamp :last_touched_supervisor_time
      t.integer :last_touched_coder_id
      t.timestamp :last_touched_coder_time
      t.integer :lock_version, :null => false, :default => 0 # for optimistic locking
      
      t.text :fields
      
      
      t.timestamps
    end
  end
end
