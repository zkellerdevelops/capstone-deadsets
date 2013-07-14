class Song < ActiveRecord::Base
  attr_accessible :title, :media_link
  has_many :setlists
  has_many :concerts, through: :setlists


  def times_played
    self.concerts.count
  end

  def first_time_played
    "#{self.concerts.last.date.strftime('%m/%d/%Y')} at #{self.concerts.last.venue}"
  end

  def last_time_played
    "#{self.concerts.first.date.strftime('%m/%d/%Y')} at #{self.concerts.first.venue}"
  end

  def avg_times_played
    concerts = Concert.where("date >= ?", self.concerts.last.date)
    total = ((times_played.to_f/concerts.count.to_f)*100).round(2)
    "#{total}% of concerts since it was introduced in #{self.concerts.last.date.strftime('%Y')}"
  end

end