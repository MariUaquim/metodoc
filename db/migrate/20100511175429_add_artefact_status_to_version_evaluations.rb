class AddArtefactStatusToVersionEvaluations < ActiveRecord::Migration
  def self.up
    change_table  :version_evaluations do |t|
      t.references  :artefact_status
    end
  end

  def self.down
    remove_column :version_evaluations, :artefact_status_id
  end
end
