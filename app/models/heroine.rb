class Heroine < ApplicationRecord
  belongs_to :power
  validates :super_name, uniqueness: { message: "Please choose another supername, that one's supertaken." }
end
