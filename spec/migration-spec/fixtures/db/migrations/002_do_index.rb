class DoIndex < ActiveRecord::Migration
  def self.up  
    add_index :users, :name
    
    create_table :users do |t|
      t.string  :name
      t.add_index :name
    end        
  end

  def self.down    
    remove_index :users, :name    
  end
end