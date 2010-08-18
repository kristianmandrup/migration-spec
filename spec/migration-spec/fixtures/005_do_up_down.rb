class DoUpDown < ActiveRecord::Migration
  def self.up  
    add_column :users, :male, :boolean
  end

  def self.down
    remove_column :users, :male
  end
  
  class << self
    def up
      create_table :users do |t|
        t.string  :name
      end
    end

    def down
      drop_table :users 
    end
  end  
end