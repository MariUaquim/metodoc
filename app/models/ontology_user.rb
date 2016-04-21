class OntologyUser < ActiveRecord::Base
belongs_to :ontology
belongs_to :user
belongs_to :paper


  def self.find_own_ontologies(ontology_id)
    OntologyUser.find(:all,:conditions =>["ontology_id =?",ontology_id])
  end

  def self.delete1(ontology_id, user_id, paper_id)
    OntologyUser.find_by_sql(['delete from ontology_users where ontology_id = ? and user_id = ? and paper_id = ?', ontology_id, user_id, paper_id ])
  end 

  def self.delete2(ontology_id, user_id)
    OntologyUser.find_by_sql(['delete from ontology_users where ontology_id = ? and user_id = ?', ontology_id, user_id])
  end 

end
