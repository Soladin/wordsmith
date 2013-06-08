require 'open-uri'

class Wordset < ActiveRecord::Base
  before_save :scrape_url
  attr_accessible :description, :name, :priority, :url, :words_attributes #, :word
  
  has_many :words

  accepts_nested_attributes_for :words, allow_destroy: true

  after_save :scrape_url #or after_create

  # maybe require Noko      active model callbacks, initialized, dirty 
  #delayed_job    background task stuff
  def scrape_url
    puts "it scrape_url"
    doc = Nokogiri::HTML(open(url))

    doc.css("b").each do |bolded|
      # could do "clean bolded (strip!)"
      Word.find_or_initialize_by_wordset_id_and_word(self, )
        self.words << Word.create({term: bolded.text})
    end

    doc.css("strong").each do |stronged|
    end

  end
end
