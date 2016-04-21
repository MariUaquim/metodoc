class AddFormalityDegreeToOntologies < ActiveRecord::Migration
  def self.up
    change_table :ontologies do |t|
      t.references  :formality_degree
    end    
  end

  def self.down
    remove_column :ontologies, :formality_degree_id
  end
end
