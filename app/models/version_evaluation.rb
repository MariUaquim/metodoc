class VersionEvaluation < ActiveRecord::Base
  belongs_to  :version
  belongs_to :artefact_status
  validates_presence_of :artefact_status_id
  validates_presence_of :version_id, :quality_criteria
  validates_uniqueness_of :version_id
end
