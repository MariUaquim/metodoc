class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column  :name,      :string, :nil=>false,  :limit=>100
      t.column  :mail,     :string, :nil=>false,  :limit=>50
      t.column  :login,     :string, :nil=>false,  :limit=>30
      t.column  :password,  :string, :nil=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end