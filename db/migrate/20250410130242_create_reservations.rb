class CreateReservations < ActiveRecord::Migration[8.0]
  def change
    create_table :reservations do |t|
      t.integer :book_id, null: false
      t.string :user_email

      t.timestamps
    end
  end
end
