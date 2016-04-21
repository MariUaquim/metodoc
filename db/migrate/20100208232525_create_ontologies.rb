class CreateOntologies < ActiveRecord::Migration
  def self.up
    create_table :ontologies do |t|
      t.column  :project_name, :string, :nil=>false, :limit=>250
      t.column  :name, :string, :nil=>false, :limit=>250
      t.column  :domain, :string, :nil=>false, :limit=>250
      t.column  :visible, :boolean, :default=>true
      t.timestamps
    end
  end

  def self.down
    drop_table :ontologies
  end
end
