class Wordset < ActiveRecord::Base
  attr_accessible :description, :name, :priority, :url

  has_many :word
end
