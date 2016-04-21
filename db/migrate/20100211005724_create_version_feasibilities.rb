class CreateVersionFeasibilities < ActiveRecord::Migration
  def self.up
    create_table :version_feasibilities do |t|
      t.references :version
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
    drop_table :version_feasibilities
  end
end
