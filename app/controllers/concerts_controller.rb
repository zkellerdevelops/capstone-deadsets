class ConcertsController < ApplicationController

  def index
    @concert = Concert.new
    # @concerts = Concert.all
    @concerts = Concert.search(params[:search])
  end

  def show
    @concert = Concert.find(params[:date])
  end

  def create
    puts params.inspect
    concert = Concert.where(:date => params[:concert][:date]).first
    redirect_to :root
  end

end
