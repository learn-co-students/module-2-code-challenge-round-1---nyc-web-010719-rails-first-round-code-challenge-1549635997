class Heroine < ApplicationRecord
  belongs_to :power
  validates :super_name, uniqueness: true

  def power_name=(name)
    self.power = Power.find_or_create_by(name: name)
  end

  def power_name
    self.power ? self.power.name : nil
  end
end
