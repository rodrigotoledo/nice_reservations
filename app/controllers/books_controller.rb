class BooksController < ApplicationController
  before_action :set_book

  def reserve
    user_email = params[:user_email]

    if @book.reserve(user_email)
      head :ok
    else
      head :unprocessable_entity
    end
  end

  def reservation
    if @book.reserved?
      render json: {
        book: book_with_last_reservation
      }, status: :ok
    else
      head :unprocessable_entity
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end

  def book_with_last_reservation
    last_reservation = @book.reservations.last
    book_info.merge(
      last_reservation: {
        user_email: last_reservation.user_email
      }
    )
  end

  def book_info
    {
      id: @book.id,
      title: @book.title,
      author: @book.author,
      reserved: @book.reserved?
    }
  end
end
