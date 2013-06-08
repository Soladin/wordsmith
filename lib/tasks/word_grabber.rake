desc "Fetch word info"
task :word_grabber => :environment do
  require 'nokogiri'
  require 'open-uri'

  url = "#{@wordset.url}"
  doc = Nokogiri::HTML(open(url))
  doc.css("b").each do |bolded|
    @words = bolded.text
  end
  doc.css("p").each do |para|
    @context = para.text
  end
end