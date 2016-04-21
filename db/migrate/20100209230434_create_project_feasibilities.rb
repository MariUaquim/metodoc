class CreateProjectFeasibilities < ActiveRecord::Migration
  def self.up
    create_table :project_feasibilities do |t|
      t.references :ontology
      t.column  :responsible, :string, :nil => false, :limit =>250
      t.column  :opportunities, :text, :nil=>false
      t.column  :problems, :text, :nil=>false
      t.column  :solutions, :text, :nil=>false
      t.column  :features, :text, :nil=>false
      t.column  :conclusion, :text, :nil=>true
      t.timestamps
    end
  end

  def self.down
    drop_table :project_feasibilities
  end
end
