class User < ApplicationRecord

  # == Constants == #

  # == Attributes == #

  # == File Uploader == #

  # == Modules == #
  rolify

  # == Validations == #
  validates_presence_of :email, :password_digest
  validates :email, uniqueness: {message: "already exist, try login."}

  # == Callbacks == #
  before_validation :set_id, on: :create
  after_create :assign_default_role
  after_create :create_profile

  # == Associations and Nested Attributes == #
  has_one :profile, dependent: :destroy
  has_many :reports, dependent: :destroy, :foreign_key => :reported_by

  # == Instance methods == #
  has_secure_password

  # == Private == #
  private

  def set_id
    self.id = SecureRandom.uuid
  end

  def assign_default_role
    self.add_role(:member) if self.roles.blank?
  end

end
