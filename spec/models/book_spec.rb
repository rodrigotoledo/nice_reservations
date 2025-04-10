require 'rails_helper'

RSpec.describe Book, type: :model do
  describe '#reserve' do
    let(:book) {create(:book)}

    it 'book can be reserved' do
      expect(book.reserve("rodrigo@rtoledo.inf.br")).to eql(true)
    end
  end
end
