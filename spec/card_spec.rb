require '../lib/card'

RSpec.describe Card do
  describe '#initialize' do
    it 'creates a card object with suit and value' do
      card = Card.new('Hearts', 'Ace')
      expect(card).to be_a(Card)
      expect(card.suit).to eq('Hearts')
      expect(card.value).to eq('Ace')
    end
  end
end
