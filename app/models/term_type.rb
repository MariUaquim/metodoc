class TermType < ActiveRecord::Base
  has_many :terms
  validates_presence_of :description
  validates_length_of :description, :within => 4..250
end
