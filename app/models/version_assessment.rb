class VersionAssessment < ActiveRecord::Base
  belongs_to :version
  belongs_to :artefact_status
  validates_presence_of :version_id, :artefact_status_id
  validates_presence_of :technical_assessment, :user_assessment
  validates_uniqueness_of :version_id
end
