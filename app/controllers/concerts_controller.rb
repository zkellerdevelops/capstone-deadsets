class ConcertsController < ApplicationController

  def index
    @concerts = Concert.search(params[:search])
    if params[:search]

      if @concerts.blank?
        flash[:notice] = "Sorry, there's no concert for this date"
      end
    end

  end


end

