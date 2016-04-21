class CreateRelashions < ActiveRecord::Migration
  def self.up
    create_table :relashions do |t|
      t.integer :term1
      t.integer :term2
      t.integer :term3
      t.integer :version_id
      t.string :positionA
      t.string :positionB


      t.timestamps
    end
  end

  def self.down
    drop_table :relashions
  end
end
