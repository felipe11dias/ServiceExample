class Anamnese < ApplicationRecord
  belongs_to :user
  has_many :exames
  
  validates :boolean_exampletwo, inclusion: { in: [true, false] }
end
