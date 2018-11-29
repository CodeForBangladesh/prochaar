class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :photo,
              :full_address, :latitude, :longitude

  belongs_to :user
end
