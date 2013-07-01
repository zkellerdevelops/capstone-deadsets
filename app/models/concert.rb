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
      where(:date => search).all
    else
      []
    end
  end

end