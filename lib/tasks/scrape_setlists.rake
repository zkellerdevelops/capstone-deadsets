desc 'Scrape grateful dead setlists from setlist.fm'
task :gd => :environment do
  require 'nokogiri'
  require 'open-uri'
	@links_count = 0
	# This range can be set up to 196. It must be set at 196 to retrieve all 1955 concerts.
	range = (1..1).to_a
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
			j = 1
			concert_page.css("ol li").each do |l|
				if l.text.delete("\n").blank?
					@group = 1
				elsif l.text.delete("\n") == "Set 1"
					@group = 1
				elsif l.text.delete("\n") == "Set 2"
					@group = 2
				elsif l.text.delete("\n") == "Set 3"
					@group = 3
				elsif l.text.delete("\n") == "Encore:"
					@group = 4
				else
					if l.children.children.children[0].present?
						title = l.children.children.children[0].text
						if l.children.children.children[2].present?
							info = l.children.children.children[2].text + l.children.children.children[3].text + l.children.children.children[4].text
						end
					else
						title = ""
					end
					song = Song.where(title: title, media_link: media_link, info: info).first_or_create
					Setlist.create(song_id: song.id, order: i, concert_id: @concert.id, group: @group)
					i += 1
				end
			end
		end
	end
	puts "The database was seeded with #{@links.count} concerts and their songs."
end