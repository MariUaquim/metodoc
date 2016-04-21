class CreateMethodsteps < ActiveRecord::Migration
  def self.up
    create_table :methodsteps do |t|
      t.string :name, :nil=>false
      t.boolean :inlifecycle, :nil=>false, :default=>true
      t.references :methodology
      t.timestamps
    end
  end

  def self.down
    drop_table :methodsteps
  end
end
