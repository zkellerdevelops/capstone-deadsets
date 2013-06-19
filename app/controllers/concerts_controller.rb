class ConcertsController < ApplicationController

  def index
    @concerts = Concert.search(params[:search])
  end

end

