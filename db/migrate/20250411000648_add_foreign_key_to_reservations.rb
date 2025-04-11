class AddForeignKeyToReservations < ActiveRecord::Migration[8.0]
  def change
    add_index :reservations, :book_id
    add_foreign_key :reservations, :books
  end
end
