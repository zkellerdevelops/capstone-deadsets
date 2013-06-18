class ConcertsController < ApplicationController

  def create
    puts params.inspect
    concert = Concert.where(:date => params[:concert][:date]).first
    redirect_to :root
  end

end
