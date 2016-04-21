class ParamsConfigTypeDoc < ActiveRecord::Base

has_many :doc_type_config
has_many :doc_type , :through => :doc_type_config
has_many :doc_artefact
end
