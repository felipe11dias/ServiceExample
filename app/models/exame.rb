class Exame < ApplicationRecord
  belongs_to :anamnese
  
  validates :tipo, length: { maximum: 45 }
end
