class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports, id: false, force: true do |t|
      t.string    :id, :limit => 36, :primary_key => true
      t.string    :reported_by
      t.string    :title
      t.json      :details
      t.string    :last_location
      t.string    :photo
      t.datetime  :missing_since
      t.string    :contact_no
      t.boolean   :is_found, default: false

      t.datetime  :archived_at
      t.timestamps
    end
  end
end
