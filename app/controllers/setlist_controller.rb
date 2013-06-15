class SetlistController < ApplicationController
  require 'nokogiri'
  require 'open-uri'

  def get_setlist
    year = 72
    24.times do
      showdate = ""
      doc = Nokogiri::HTML(open("http://www.cs.cmu.edu/~mleone/gdead/setlists/dead-sets/#{year}/")).css('pre a')

      doc.each do |link|
        link_text = link.values.first.to_s
        if link_text.match(/^[123456789]/)
          showdate = link_text.chomp('.txt')
          deadset = open("http://www.cs.cmu.edu/~mleone/gdead/setlists/dead-sets/#{year}/#{link_text}").read
          setlist = Setlist.create( :showdate => showdate, :deadset => deadset )
        end
      end

      year += 1
    end
  end

end
