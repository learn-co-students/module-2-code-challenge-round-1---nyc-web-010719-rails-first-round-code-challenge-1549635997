class Heroine < ApplicationRecord
  belongs_to :power
  validates :super_name, uniqueness: { message: " error: Please choose another supername, that one's supertaken." }
end
