class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :user_roles

  def user_roles
    object.roles.pluck(:name)
  end
end
