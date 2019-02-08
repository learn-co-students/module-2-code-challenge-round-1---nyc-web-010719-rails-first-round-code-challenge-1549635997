class Heroine < ApplicationRecord
  belongs_to :power
  validates :super_name, uniqueness: true

  def power
    Power.find(self.power_id)
  end

  def power_name
    power.name
  end
end
