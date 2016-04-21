

class Methodstep < ActiveRecord::Base

belongs_to  :methodology
has_many :doc_type, :dependent => :destroy

end
