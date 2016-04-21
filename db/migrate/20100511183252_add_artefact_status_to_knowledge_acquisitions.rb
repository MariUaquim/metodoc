class AddArtefactStatusToKnowledgeAcquisitions < ActiveRecord::Migration
  def self.up
    change_table  :knowledge_acquisitions do |t|
      t.references  :artefact_status
    end
  end

  def self.down
    remove_column :knowledge_acquisitions, :artefact_status_id
  end
end
