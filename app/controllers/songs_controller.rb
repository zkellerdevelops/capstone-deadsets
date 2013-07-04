class SongsController < ApplicationController
  expose(:song) { Song.find(params[:id]) }

	def new
		@song = Song.new
	end

	def create
		@song.save!
	end

end

