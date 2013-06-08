class Wordset < ActiveRecord::Base
  attr_accessible :description, :name, :priority, :url, :words_attributes #, :word
  
  has_many :words

  accepts_nested_attributes_for :words, allow_destroy: true

  after_save :scrape_url #or after_create

  # maybe require Noko      active model callbacks, initialized, dirty 
  #delayed_job    background task stuff
  def scrape_url
    doc = Nokogiri::HTML(open(url))

    doc.css("b").each do |bolded|
      # clean bolded (strip!)
      self.words << Word.create({term: bolded})
    end

    doc.css("strong").each do |stronged|
    end

  end
end
