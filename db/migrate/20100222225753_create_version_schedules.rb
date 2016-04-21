class CreateVersionSchedules < ActiveRecord::Migration
  def self.up
    create_table :version_schedules do |t|
      t.references :version
      t.column  :activity_name, :string, :nil=>false
      t.column  :activity_description, :text, :nil=>true
      t.column  :activity_date, :datetime, :nil=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :version_schedules
  end
end
