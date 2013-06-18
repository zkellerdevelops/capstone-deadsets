desc 'Scrape grateful dead setlists from pre-exisiting website'
task :get_show_data => :environment do
  require 'nokogiri'
  require 'open-uri'

    year = 72
    24.times do
      date = ""
      doc = Nokogiri::HTML(open("http://www.cs.cmu.edu/~mleone/gdead/setlists/dead-sets/#{year}/")).css('pre a')

      doc.each do |link|
        link_text = link.values.first.to_s
        if link_text.match(/^[123456789]/)
          date = link_text.chomp('.txt')
          details = open("http://www.cs.cmu.edu/~mleone/gdead/setlists/dead-sets/#{year}/#{link_text}").read
          concert = Concert.create( :date => date, :details => details )
        end
      end

      year += 1
    end

end
