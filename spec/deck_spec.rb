require '../lib/deck'

RSpec.describe Deck do
  describe '#initialize' do
    it 'creates a deck object with 52 cards' do
      deck = Deck.new
      expect(deck.cards.length).to eq(52)
    end
  end

  describe '#shuffle' do
    it 'shuffles the deck' do
      initial_cards = Deck.new.cards.dup
      deck = Deck.new
      deck.shuffle
      expect(deck.cards).not_to eq(initial_cards)
    end
  end

  describe '#deal' do
    it 'deals a specified number of cards' do
      deck = Deck.new
      cards = deck.deal(5)
      expect(cards.length).to eq(5)
      expect(deck.cards.length).to eq(52 - 5)
    end
  end
end
