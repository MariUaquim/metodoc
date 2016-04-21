class Answer < ActiveRecord::Base

belongs_to :document
belongs_to :question
belongs_to :type_answer


end
