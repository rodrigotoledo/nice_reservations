require "rails_helper"

RSpec.describe "Books Reserve", type: :request do
  let(:book) { create(:book) }
  let(:reserved_book) { create(:book, :with_reservation) }

  describe "POST /books/:id/reserve" do
    context "Can reserve a book" do
      it "status 200" do
        post book_reserve_path(book), params: {user_email: "user@example.com"}
        expect(response).to have_http_status(:ok)
      end
    end

    context "The book is alread reserved" do
      it "status 422" do
        post book_reserve_path(reserved_book), params: {user_email: "user@example.com"}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "GET /books/:id/reservation" do
    context "with reserved book" do
      before { get book_reservation_path(reserved_book) }

      it "returns the most recent reservation" do
        json = JSON.parse(response.body)
        last_reservation = reserved_book.reservations.last
        expect(json["book"]["last_reservation"]["user_email"]).to eq(last_reservation.user_email)
      end
    end
  end

  context "When book dont exists" do
    it "status 404" do
      post book_reserve_path(-1)
      expect(response).to have_http_status(:not_found)
    end
  end
end
