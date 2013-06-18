class Concert < ActiveRecord::Base
  attr_accessible :date, :details

  def self.search(search)
    if search
      where(:date => search).all
    else
      []
    if @search.blank?
      flash[:notice] = 'No concert for this date'
    end
    end
  end
end