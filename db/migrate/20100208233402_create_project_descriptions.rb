class CreateProjectDescriptions < ActiveRecord::Migration
  def self.up
    create_table :project_descriptions do |t|
      t.references :ontology
      t.column  :date, :datetime, :nil=>false
      t.column  :purpose, :text, :nil=>false
      t.column  :obs, :text, nil=>true
      t.timestamps
    end
  end

  def self.down
    drop_table :project_descriptions
  end
end