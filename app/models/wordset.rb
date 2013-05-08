class Wordset < ActiveRecord::Base
  attr_accessible :description, :name, :priority

  has_many :word
end
