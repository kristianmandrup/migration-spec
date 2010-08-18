class DoColumns < ActiveRecord::Migration
  def self.up  
    create_table :users do |t|
      t.string  :name
    end    
    add_index :name
  end

  def self.down    
    remove_index :name    
  end
end