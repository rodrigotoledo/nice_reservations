class Book < ApplicationRecord
  has_many :reservations

  def reserve(user_email)
    return false if reserved?

    reservations.build(user_email: user_email).save
    update!(reserved: true)
  end

  def status
    reserved? ? "reserved" : nil
  end
end
