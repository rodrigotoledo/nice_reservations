require "rails_helper"

RSpec.describe Book, type: :model do
  let(:book) { create(:book) }
  let(:user_email) { "rodrigo@rtoledo.inf.br" }

  describe "#reserve" do
    context "when book is available" do
      it "creates a reservation" do
        expect {
          book.reserve(user_email)
        }.to change(book.reservations, :count).by(1)
      end

      it "book can be reserved" do
        expect(book.reserve("rodrigo@rtoledo.inf.br")).to eql(true)
      end
    end
  end

  describe "#status" do
    context "when book is available" do
      it "returns nil" do
        expect(book.status).to be_nil
      end
    end

    context "when book is reserved" do
      before { book.update!(reserved: true) }

      it 'returns "reserved"' do
        expect(book.status).to eq("reserved")
      end
    end
  end
end
