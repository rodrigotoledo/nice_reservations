class Reservation < ApplicationRecord
  belongs_to :book, foreign_key: :book_id
end
