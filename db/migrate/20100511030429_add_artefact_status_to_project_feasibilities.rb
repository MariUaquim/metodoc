class AddArtefactStatusToProjectFeasibilities < ActiveRecord::Migration
  def self.up
    change_table  :project_feasibilities do |t|
      t.references  :artefact_status
    end
  end

  def self.down
    remove_column :project_feasibilities, :artefact_status_id
  end
end
