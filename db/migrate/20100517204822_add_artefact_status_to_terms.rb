class AddArtefactStatusToTerms < ActiveRecord::Migration
  def self.up
    change_table  :terms do |t|
      t.references  :artefact_status
    end
  end

  def self.down
    remove_column :terms, :artefact_status_id
  end
end
