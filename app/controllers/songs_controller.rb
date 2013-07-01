class SongsController < ApplicationController
	def new
		@song = Song.new
	end

	def create
		@song.save!
	end

end

