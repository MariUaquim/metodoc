class AddArtefactStatusToVersionDescriptions < ActiveRecord::Migration
  def self.up
    change_table  :version_descriptions do |t|
      t.references  :artefact_status
    end
  end

  def self.down
    remove_column :version_descriptions, :artefact_status_id
  end
end
