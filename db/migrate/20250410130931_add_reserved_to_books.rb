class AddReservedToBooks < ActiveRecord::Migration[8.0]
  def change
    add_column :books, :reserved, :boolean, default: false
  end
end
