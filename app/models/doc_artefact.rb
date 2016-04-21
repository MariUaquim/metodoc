class DocArtefact < ActiveRecord::Base
belongs_to :document
belongs_to :params_config_type_doc

end
