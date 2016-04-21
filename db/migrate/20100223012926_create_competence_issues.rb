class CreateCompetenceIssues < ActiveRecord::Migration
  def self.up
    create_table :competence_issues do |t|
      t.references  :version
      t.column  :question, :string, :nil=>false, :limit=>250
      t.timestamps
    end
  end

  def self.down
    drop_table :competence_issues
  end
end
