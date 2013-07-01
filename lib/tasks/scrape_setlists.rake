desc 'Scrape grateful dead setlists from setlist.fm'
task :gd => :environment do
  require 'nokogiri'
  require 'open-uri'
	@links_count = 0
	range = (1..196).to_a
	range.each do |i|
		page = Nokogiri::HTML(open("http://www.setlist.fm/setlists/grateful-dead-bd6ad4a.html?page=#{i}"))
		# Nokogiri supports CSS-style selectors
		@links = []
		page.search('#id1d h2 a').each { |a| @links << a['href'] }
		@links.each do |url|
			url = url[1..-1]
			url = url[1..-1]
			concert_page = Nokogiri::HTML(open("http://www.setlist.fm#{url}"))
			@date = concert_page.css(".dateBlock").text.delete("\n")
			header = []
			concert_page.css(".eventBlock .value").each do |e|
				header << e.text
			end
			@concert = Concert.create(date: @date, venue: header[1], tour: header[2])
			i = 1
			concert_page.css("ol li").each do |l|
				if l.text.delete("\n").match("Set") || l.text.delete("\n").match("Encore")
					@group = l.text.delete("\n")
				else
					if l.children.children.children[0].present?
						title = l.children.children.children[0].text
					else
						title = "blank"
					end
					song = Song.where(title: title).first_or_create
					Setlist.create(song_id: song.id, order: i, concert_id: @concert.id, group: @group)
					i += 1
				end
			end
		end
	end
end