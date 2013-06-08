class Word < ActiveRecord::Base
  attr_accessible :definition, :term
  belongs_to :wordset
end
