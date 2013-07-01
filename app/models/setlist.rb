class Setlist < ActiveRecord::Base
  attr_accessible :concert_id, :song_id, :order, :group
  belongs_to :concert
  belongs_to :song
end
