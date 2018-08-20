class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable
  include DeviseTokenAuth::Concerns::User

  has_one :anamnese
  #has_one :update
  
  #paranoia
  acts_as_paranoid

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  validates :name, length: { maximum: 45 }
  validates :password, length: { maximum: 150 }
  validates :address, length: { maximum: 100 }

end
