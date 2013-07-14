class ConcertsController < ApplicationController
  expose(:concerts) do
    if params[:search_by_date]
      Concert.search_by_date(params[:search_by_date])
    elsif params[:search_by_venue]
      Concert.search_by_venue(params[:search_by_venue])
    elsif params[:search_by_tour]
      Concert.search_by_tour(params[:search_by_tour])
    else
      concerts = todays_concerts
    end
  end

  expose(:concerts_count) { concerts.count }

  def index
    if concerts.blank?
      flash[:notice] = "Please try again"
    end
  end


  def todays_concerts
    concert_collection = Concert.all
    concert_collection.collect! do |concert|
      if concert.date.strftime('%m/%d') == Time.now.strftime('%m/%d')
        concert
      end
    end
    concert_collection.reject! { |c| c.nil? }
  end

end

