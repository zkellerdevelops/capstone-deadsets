module ConcertsHelper

  def venue_options
    concerts = Concert.all.map { |c| c }
    concerts.uniq! { |c| c.venue }
    concerts.sort_by { |c| c.venue }
  end

  def venues_count
    venue_options.count
  end

  def songs_count
    Song.all.count
  end

  def tour_options
    concerts = Concert.all.map { |c| c }
    concerts.uniq! { |c| c.tour }
  end

  def search_criteria
    if params[:search_by_date]
      params[:search_by_date]
    elsif params[:search_by_venue]
      params[:search_by_venue]
    elsif params[:search_by_tour]
      params[:search_by_tour]
    else
      "Today in Grateful Dead history"
    end
  end

  # def concert_sets(concert)
  #   first_set = []
  #   second_set = []
  #   third_set = []
  #   encore = []
  #   concert.setlists.each do |setlist|
  #     if setlist.group == "Set 1"
  #       first_set << [setlist.song.title, setlist.song_id, setlist.order]
  #     elsif setlist.group == "Set 2"
  #       second_set << [setlist.song.title, setlist.song_id, setlist.order]
  #     elsif  setlist.group == "Set 3"
  #       third_set << [setlist.song.title, setlist.song_id, setlist.order]
  #     elsif  setlist.group == "Encore:"
  #       binding.pry
  #       encore << [setlist.song.title, setlist.song_id, setlist.order]
  #     end
  #   end
  #   first_set.unshift(["Set 1", 0, 0])
  #   second_set.unshift(["Set 2", 0, 0])
  #   third_set.unshift(["Set 3", 0, 0])
  #   encore.unshift(["Encore", 0, 0])
  #   setlists = [first_set, second_set, third_set, encore]
  # end
end