class Power < ApplicationRecord
  has_many :heroines

  def heroines
    Heroine.all 
  end
end
