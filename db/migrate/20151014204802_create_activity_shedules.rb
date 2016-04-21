class CreateActivityShedules < ActiveRecord::Migration
  def self.up
    create_table :activity_shedules do |t|
      t.string :name
      t.string :description
      t.date :deadline
      t.integer :priority
      t.references :user, :document
      t.timestamps
    end
  end

  def self.down
    drop_table :activity_shedules
  end
end
