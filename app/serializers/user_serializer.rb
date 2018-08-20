class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password,
  :authenticity_token, :address, :birth_day
end
