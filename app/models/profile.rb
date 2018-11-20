class Profile < ApplicationRecord

  # == Constants == #

  # == Attributes == #

  # == File Uploader == #

  # == Modules == #

  # == Validations == #
  validates_presence_of :first_name, :last_name, :full_address, :contact_number, :latitude, :longitude, on: :update
  validates :latitude , numericality: { greater_than_or_equal_to:  -90, less_than_or_equal_to:  90 }, on: :update
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }, on: :update

  # == Callbacks == #
  before_validation :set_id, on: :create

  # == Associations and Nested Attributes == #
  belongs_to :user

  # == Instance methods == #

  # == Private == #
  private

  def set_id
    self.id = SecureRandom.uuid
  end

end
