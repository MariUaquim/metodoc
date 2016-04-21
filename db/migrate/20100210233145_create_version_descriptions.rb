class CreateVersionDescriptions < ActiveRecord::Migration
  def self.up
    create_table :version_descriptions do |t|
      t.references :version
      t.column  :date, :datetime, :nil=>false
      t.column  :responsible, :string, :nil=>false, :limit=>250
      t.column  :purpose, :text, :nil=>false
      t.column  :obs, :text, nil=>true
      t.timestamps
    end
  end

  def self.down
    drop_table :version_descriptions
  end
end
