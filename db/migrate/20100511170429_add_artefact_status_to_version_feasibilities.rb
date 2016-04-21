class AddArtefactStatusToVersionFeasibilities < ActiveRecord::Migration
  def self.up
    change_table  :version_feasibilities do |t|
      t.references  :artefact_status
    end
  end

  def self.down
    remove_column :version_feasibilities, :artefact_status_id
  end
end
