class ConcertsController < ApplicationController

  def index
  	if params[:search_by_date]
    	@concerts = Concert.search_by_date(params[:search_by_date])
    	@search_term = params[:search_by_date]
    elsif params[:search_by_venue]
    	@concerts = Concert.search_by_venue(params[:search_by_venue])
    	@search_term = params[:search_by_venue]
    elsif params[:search_by_tour]
    	@concerts = Concert.search_by_tour(params[:search_by_tour])
    	@search_term = params[:search_by_tour]
    end
    @shows = Concert.all

    @venues = @shows.uniq {|c| c.venue }
    @tours = @shows.uniq {|c| c.tour unless c.blank? }

  if @concerts.blank?
    flash[:notice] = "Sorry there is no match for your search criteria"
  end

  end


end

