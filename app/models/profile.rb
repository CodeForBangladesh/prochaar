class Profile < ApplicationRecord

  # == Constants == #

  # == Attributes == #

  # == File Uploader == #

  # == Modules == #

  # == Validations == #

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
