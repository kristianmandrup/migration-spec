class DoTblColumns < ActiveRecord::Migration
  def self.up  
    add_column :users, :name, :string
    add_column :users, :age,  :integer
    add_column :users, :male, :boolean
  end

  def self.down
    remove_column :users, :name
    remove_column :users, :age
    remove_column :users, :male
  end
end