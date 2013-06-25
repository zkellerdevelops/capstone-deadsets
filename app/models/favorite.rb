class Favorite < ActiveRecord::Base
  attr_accessible :concert_id
  validates_presence_of :user, :concert

  belongs_to :user
  belongs_to :concert

    def setlist
      songs = concert.details.split("\n")
      songs[2, songs.size - 2].join("\n")
    end
end