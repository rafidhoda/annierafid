class AddFieldsToRsvp < ActiveRecord::Migration[5.1]
  def change
    add_column :rsvps, :coming, :boolean
    add_column :rsvps, :transportation, :integer
  end
end
