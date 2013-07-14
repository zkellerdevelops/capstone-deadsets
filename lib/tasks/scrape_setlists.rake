desc 'Scrape grateful dead setlists from setlist.fm'
task :gd => :environment do
  require 'nokogiri'
  require 'open-uri'
	# This range can be set up to 196. It must be set at 196 to retrieve all 1955 concerts.
	range = (39..39).to_a
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
				if l.text.delete("\n").match("Set") || l.text.delete("\n").match("Encore:")
					@group = l.text.delete("\n")
				else
					if l.children.children.children[0].present?
						title = l.children.children.children[0].text
						if l.children.children.children[2].present?
							info = l.children.children.children[2].text + l.children.children.children[3].text + l.children.children.children[4].text
						end
					else
						title = nil
					end
					song = Song.where(title: title, info: info).first_or_create
					Setlist.create(song_id: song.id, order: i, concert_id: @concert.id, group: @group)
					i += 1
				end
			end
		end
	end
	Setlist.where(group: "Set One").each do |set|
		set.group = "Set 1"
		set.save
	end
	Setlist.where(group: "Set Two").each do |set|
		set.group = "Set 2"
		set.save
	end
	song = Song.where(title: nil).first.destroy
	Setlist.where(song_id: song.id).each do |set|
		set.destroy
	end
	puts "Concerts: #{Concert.all.count}"
	puts "Songs: #{Song.all.count}"
end