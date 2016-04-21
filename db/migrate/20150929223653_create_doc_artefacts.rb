class CreateDocArtefacts < ActiveRecord::Migration
  def self.up
    create_table :doc_artefacts, :id=>false do |t|
      t.text :answer
      t.references :document,:params_config_type_doc
      t.timestamps
    end
  end

  def self.down
    drop_table :doc_artefacts
  end
end
