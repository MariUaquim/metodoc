class AddArtefactStatusToCompetenceIssues < ActiveRecord::Migration
  def self.up
    change_table  :competence_issues do |t|
      t.references  :artefact_status
    end
  end

  def self.down
    remove_column :competence_issues, :artefact_status_id
  end
end
