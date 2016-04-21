class CreateKnowledgeAcquisitions < ActiveRecord::Migration
  def self.up
    create_table :knowledge_acquisitions do |t|
      t.references  :version
      t.column  :sources, :text, :nil=>false
      t.column  :strategies, :text, :nil=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :knowledge_acquisitions
  end
end
