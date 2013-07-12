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

  def first_set
    self.setlists.where(group: "Set 1")
  end

  def second_set
    self.setlists.where(group: "Set 2")
  end

  def third_set
    self.setlists.where(group: "Set 3")
  end

  def encore
    self.setlists.where(group: "Encore:")
  end
end