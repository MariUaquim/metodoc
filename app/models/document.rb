class Document < ActiveRecord::Base

belongs_to :doc_type
belongs_to :ontology
belongs_to :version
belongs_to :artefact_status

has_many :doc_artefact
has_many :responsable
has_many :questions, :dependent => :destroy
has_many :answer, :dependent => :destroy
end
