class VersionDescription < ActiveRecord::Base
  belongs_to  :version
  belongs_to :artefact_status
  validates_presence_of :artefact_status_id
  validates_presence_of :version_id
  validates_presence_of :date
  validates_presence_of :responsible
  validates_presence_of :purpose
  validates_uniqueness_of :version_id
end
