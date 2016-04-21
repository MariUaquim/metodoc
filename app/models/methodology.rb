class Methodology < ActiveRecord::Base
has_many :methodstep, :dependent => :destroy
has_many :ontology, :dependent => :destroy
end
