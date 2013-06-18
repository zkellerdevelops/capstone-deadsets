class SetlistsController < ApplicationController

  def create
    date = params[:date][:details]
    concert = Concert.where("date = ?", date).first
    @details = :details
    redirect_to :root
  end

  def create
    date = params[:date][:details]
    concert = Concert.where("showdate = ?", date).first
    @details = :details
    redirect_to :root
  end

end
