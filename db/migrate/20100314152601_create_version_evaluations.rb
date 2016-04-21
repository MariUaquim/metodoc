class CreateVersionEvaluations < ActiveRecord::Migration
  def self.up
    create_table :version_evaluations do |t|
      t.references  :version
      t.column  :quality_criteria, :text, :nil=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :version_evaluations
  end
end
