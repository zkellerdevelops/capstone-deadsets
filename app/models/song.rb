class Song < ActiveRecord::Base
  attr_accessible :title, :media_link
  has_many :setlists

end