class CreateGuests < ActiveRecord::Migration[5.1]
  def change
    create_table :guests do |t|
      t.string :first_name
      t.string :last_name
      t.references :rsvp, foreign_key: true

      t.timestamps
    end
  end
end
