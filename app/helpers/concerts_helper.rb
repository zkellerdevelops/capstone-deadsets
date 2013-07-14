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

end