class ConcertsController < ApplicationController

  def index
    @concerts = Concert.search(params[:search])
  end

  def slice_zero
    if date.starts_with "0"
      date.slice!(0)
      date
    end
  end

end
