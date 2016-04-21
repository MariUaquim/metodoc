class CreateVersionAssessments < ActiveRecord::Migration
  def self.up
    create_table :version_assessments do |t|
      t.references  :version
      t.references  :artefact_status
      t.column  :technical_assessment, :text, :nil => false
      t.column  :user_assessment, :text, :nil => false
      t.timestamps
    end
  end

  def self.down
    drop_table :version_assessments
  end
end
