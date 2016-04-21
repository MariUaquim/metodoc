class UserOption < ActiveRecord::Base
  validates_presence_of :user_id, :artefact_model_id
  validates_uniqueness_of :user_id
  belongs_to  :user
  belongs_to  :artefact_model
end
