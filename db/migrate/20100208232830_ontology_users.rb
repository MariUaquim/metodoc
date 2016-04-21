class OntologyUsers < ActiveRecord::Migration
  def self.up
    create_table :ontology_users, :id => false do |t|
      t.references :ontology, :user, :paper
    end

  end

  def self.down
    drop_table  :ontology_users
  end
end
