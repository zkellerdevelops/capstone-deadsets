class Concert < ActiveRecord::Base
  attr_accessible :date, :details

  def self.search(search)
    if search
      where(:date => search).all
    else
      []
    end
  end
end