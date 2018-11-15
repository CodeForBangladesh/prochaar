class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, id: false, force: true do |t|
      t.string    :id, :limit => 36, :primary_key => true
      t.string    :email
      t.string    :password_digest
      t.boolean   :confirmed, default: false
      t.datetime  :archived_at

      t.timestamps
    end
  end
end
