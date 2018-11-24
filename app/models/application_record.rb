class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def set_id
    self.id = SecureRandom.uuid
  end
end
