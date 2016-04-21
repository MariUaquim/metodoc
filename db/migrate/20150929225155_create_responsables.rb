class CreateResponsables < ActiveRecord::Migration
  def self.up
    create_table :responsables,:id=>false do |t|
      t.integer :level
      t.references :document,:user
      t.timestamps
    end
  end

  def self.down
    drop_table :responsables
  end
end
