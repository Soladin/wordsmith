require 'open-uri'

class Wordset < ActiveRecord::Base
  before_save :scrape_url # or after_save, after_create?
  attr_accessible :description, :name, :priority, :url, :words_attributes

  validates :name, :presence => true
  
  has_many :words, autosave: true, dependent: :destroy

  accepts_nested_attributes_for :words, allow_destroy: true

  def scrape_url
    doc = Nokogiri::HTML(open(url))

    doc.css("b").each do |bolded|
      # strip?
      add_word_if_new(bolded.text)
    end

    doc.css("strong").each do |stronged|
      add_word_if_new(stronged.text)
    end
  end

  def add_word_if_new(term)
    word = self.words.find_or_initialize_by_term(term: term)
    self.words << word if word.new_record?
  end
end
