class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles, id: false, force: true do |t|
      t.string    :id, :limit => 36, :primary_key => true
      t.string    :user_id
      t.string    :first_name
      t.string    :last_name
      t.string    :gender
      t.string    :gender
      t.string    :photo
      t.date      :date_of_birth
      t.string    :full_address
      t.string    :contact_number
      t.string    :district
      t.string    :division
      t.string    :street_address
      t.string    :zip_code
      t.decimal   :latitude
      t.decimal   :longitude

      t.timestamps
    end
  end
end
