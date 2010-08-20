class DoTblColumns < ActiveRecord::Migration
  def self.up  
    remove_column :users, :name
    rename_column :users, :name, :first_name
    add_column :users, :last_name, :string # assume string
  end

  def self.down
    add_column :users, :age, :integer
    change_column :users, :last_name, :string # assume string
    change_column :users, :age, :integer
  end
end