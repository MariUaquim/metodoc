class DocType < ActiveRecord::Base

has_many :doc_type_config, :dependent => :destroy
has_many :document

belongs_to :methodstep

end
