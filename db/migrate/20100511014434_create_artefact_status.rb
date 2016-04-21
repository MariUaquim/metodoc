class CreateArtefactStatus < ActiveRecord::Migration
  def self.up
    create_table :artefact_status do |t|
      t.column  :description, :string, :nil=>false, :limit=>250
      t.timestamps
    end
  end

  def self.down
    drop_table :artefact_status
  end
end
