class CreateGifts < ActiveRecord::Migration[5.1]
  def change
    create_table :gifts do |t|
      t.integer :amount
      t.string :currency

      t.timestamps
    end
  end
end
