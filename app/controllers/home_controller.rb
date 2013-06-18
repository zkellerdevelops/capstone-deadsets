class HomeController < ApplicationController

  def index
    @concert = Concert.new
  end

end