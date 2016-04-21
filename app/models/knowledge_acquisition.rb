class KnowledgeAcquisition < ActiveRecord::Base
  belongs_to :version
  belongs_to :artefact_status
  validates_presence_of :artefact_status_id
  validates_presence_of :version_id
  validates_presence_of :sources
  validates_presence_of :strategies
  validates_uniqueness_of :version_id
end
