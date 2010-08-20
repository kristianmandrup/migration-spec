class DoTables < ActiveRecord::Migration
  class << self
    def up
      create_table :users do |t|
        t.string  :name
        t.integer :age
        t.boolean :admin
      end
    end

    def down
      drop_table :users 
    end
  end
  
  def self.up  
    create_table :users do |t|
      t.string  :name
      t.integer :age
      t.boolean :admin
    end

    change_table :roles do |t|
      ...
    end
  end

  def self.down
    drop_table :users do |t|
      t.string  :name
      t.integer :age
      t.boolean :admin
    end

    rename_table :roles do |t|
      ...
    end

  end
end