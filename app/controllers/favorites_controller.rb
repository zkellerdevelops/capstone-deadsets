class FavoritesController < ApplicationController

  def index
    @favorites = current_user.favorites
  end

  def create
    @favorite = Favorite.new(params[:favorite])
    @favorite.user = current_user
    @favorite.save
    redirect_to :back
    flash[:notice] = "This show was added to your favorites."
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    if @favorite.destroy
      flash[:notice] = "Selected favorite was deleted"
      redirect_to :back
    else flash[:error] = "Selected favorite was not deleted. Please try again."
      redirect_to :back
    end
  end

end