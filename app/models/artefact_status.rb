class ArtefactStatus < ActiveRecord::Base
  validates_presence_of :description
  validates_uniqueness_of :description
  has_many :project_descriptions
  has_many :project_feasibilities
  has_many :version_descriptions
  has_many :version_feasibilities
  has_many :version_schedules
  has_many :version_evaluations
  has_many :knowledge_acquisitions
  has_many :competence_issues
  has_many :documents
  has_many :version_assessments
  has_many :terms
end
