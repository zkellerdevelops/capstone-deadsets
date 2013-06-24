class FavoritesController < ApplicationController

  def index
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new(params[:favorite])
    @favorite.user = current_user
    @favorite.save
    redirect_to :back
  end

end