class Question < ActiveRecord::Base

belongs_to :document
belongs_to :type_answer

has_many :answer, :dependent => :destroy

end
