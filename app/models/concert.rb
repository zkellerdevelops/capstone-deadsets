class Concert < ActiveRecord::Base
  attr_accessible :date, :venue, :tour
  has_many :setlists
  has_many :songs, through: :setlists
  has_many :users, through: :favorites
  has_many :favorites

  def self.search_by_date(search)
    if search
      search_split = search.split("-")
        search_split.each do |search|
          if search.starts_with? "0"
            search.slice!(0)
          end
        end
      search = search_split.join("-").to_s
      where(date: search).all
    else
      []
      flash[:notice] = "Sorry there is no match for your search criteria"
    end
  end

  def self.search_by_venue(search)
    if search
      search_split = search.split("-")
        search_split.each do |search|
          if search.starts_with? "0"
            search.slice!(0)
          end
        end
      search = search_split.join("-").to_s
      where(venue: search).all
    else
      []
      flash[:notice] = "Sorry there is no match for your search criteria"
    end
  end

  def self.search_by_tour(search)
    if search
      search_split = search.split("-")
        search_split.each do |search|
          if search.starts_with? "0"
            search.slice!(0)
          end
        end
      search = search_split.join("-").to_s
      where(tour: search).all
    else
      []
      flash[:notice] = "Sorry there is no match for your search criteria"
    end
  end
end