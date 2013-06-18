class HomeController < ApplicationController

  def index
    @concert = Concert.new
  end

  def create
    concert = params[:date][:details]
    concert = Concert.where("showdate = ?", date).first
    @concert = :details
    redirect_to :root
  end

end