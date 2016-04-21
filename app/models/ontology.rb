class Ontology < ActiveRecord::Base
  has_many :versions, :dependent => :destroy
  has_one  :project_description, :dependent => :destroy
  has_one  :project_feasibility, :dependent => :destroy
  
  has_many :ontology_user, :dependent => :destroy
  has_many :user, :through => :ontology_user
  has_many :paper, :through => :ontology_user
  has_many :document

  belongs_to  :formality_degree
  belongs_to  :methodology

  validates_presence_of :project_name
  validates_presence_of :name
  validates_presence_of :domain
  validates_presence_of :formality_degree_id
  validates_presence_of :methodology_id
  validates_uniqueness_of :project_name
  validates_uniqueness_of :name
  validates_length_of :project_name, :within => 3..250
  validates_length_of :name, :within => 3..250
  validates_length_of :domain, :within => 3..250

  def self.find_own_ontologies(user_id)
    Ontology.find(:all, :include => [ :user], :conditions =>["ontology_users.user_id=?",user_id])
  end

  def self.find_visible_ontologies
    Ontology.find(:all, :conditions=>{:visible=>true})
  end
end
