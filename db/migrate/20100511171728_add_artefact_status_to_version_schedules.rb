class AddArtefactStatusToVersionSchedules < ActiveRecord::Migration
  def self.up
    change_table  :version_schedules do |t|
      t.references  :artefact_status
    end
  end

  def self.down
    remove_column :version_schedules, :artefact_status_id
  end
end
