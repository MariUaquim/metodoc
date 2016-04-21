class ArtefactModel < ActiveRecord::Base
  validates_presence_of :name, :filename
  has_many  :user_options
end
