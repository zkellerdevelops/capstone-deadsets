class Favorite < ActiveRecord::Base
  attr_accessible :concert_id
  validates_presence_of :user, :concert

  belongs_to :user
  belongs_to :concert
end