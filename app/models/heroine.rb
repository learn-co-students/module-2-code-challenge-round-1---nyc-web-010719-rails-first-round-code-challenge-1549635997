class Heroine < ApplicationRecord
  belongs_to :power
  validates :name, uniqueness: true

  def self.search(search)
    if search
      superpower = Power.find_by(name: search)
      if superpower
        self.where(power_id: superpower)
      else
        Heroine.all
      end
    else
      Heroine.all
    end
  end

end
