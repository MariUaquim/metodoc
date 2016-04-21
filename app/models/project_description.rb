class ProjectDescription < ActiveRecord::Base
  belongs_to :ontology
  belongs_to :artefact_status
  validates_presence_of :artefact_status
  validates_presence_of :date
  validates_presence_of :purpose
  validates_presence_of :ontology_id
  validates_uniqueness_of :ontology_id
end
