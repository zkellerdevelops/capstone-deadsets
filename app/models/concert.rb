class Concert < ActiveRecord::Base
  attr_accessible :date, :details

  def self.search(search)
    if search
      if search.starts_with? "0"
        search.slice!(0)
      end
      where(:date => search).all
    else
      []
    end
  end

  # def slice_zero(search)
  #   if search.starts_with "0"
  #     search.slice!(0)
  #     search
  #   end
  # end

end