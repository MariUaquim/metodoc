class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.integer :doc_reference
      t.references :doc_type, :ontology, :version, :artefact_status
      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end
