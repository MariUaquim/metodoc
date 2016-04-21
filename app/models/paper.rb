class Paper < ActiveRecord::Base
  has_many :ontology_user
  has_many :ontology, :through => :ontology_user
  has_many :user, :through => :ontology_user
  has_and_belongs_to_many :functions

end
