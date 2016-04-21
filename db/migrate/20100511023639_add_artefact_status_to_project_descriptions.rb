class AddArtefactStatusToProjectDescriptions < ActiveRecord::Migration
  def self.up
    change_table :project_descriptions do |t|
      t.references  :artefact_status
    end
  end

  def self.down
    remove_column :project_descriptions, :artefact_status_id
  end
end
