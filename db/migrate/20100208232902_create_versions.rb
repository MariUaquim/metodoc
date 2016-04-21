class CreateVersions < ActiveRecord::Migration
  def self.up
    create_table :versions do |t|
      t.references  :ontology
      t.column  :number, :integer, :nil=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :versions
  end
end