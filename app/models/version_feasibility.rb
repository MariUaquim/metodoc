class VersionFeasibility < ActiveRecord::Base
  belongs_to :version
  belongs_to :artefact_status
  validates_presence_of :artefact_status_id
  validates_presence_of :version_id
  validates_presence_of :responsible
  validates_presence_of :opportunities
  validates_presence_of :problems
  validates_presence_of :solutions
  validates_presence_of :features
  validates_uniqueness_of :version_id
end
