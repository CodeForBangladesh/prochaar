class Report < ApplicationRecord

  # == Constants == #

  # == Attributes == #

  # == File Uploader == #
  mount_uploader :photo, ReportPhotoUploader

  # == Modules == #

  # == Validations == #
  validates_presence_of :title, :details, :last_location, :photo, :missing_since, :contact_no

  # == Callbacks == #
  before_validation :set_id, on: :create

  # == Associations and Nested Attributes == #
  belongs_to :reporter, class_name: "User", foreign_key: :reported_by

  # == Instance methods == #

  # == Private == #
  private

end
