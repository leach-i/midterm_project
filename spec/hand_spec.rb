require '../lib/hand'

RSpec.describe Hand do
  describe '#evaluate' do
    it 'returns :straight_flush for a straight flush hand' do
      hand = Hand.new([
        Card.new('Hearts', '10'),
        Card.new('Hearts', 'Jack'),
        Card.new('Hearts', 'Queen'),
        Card.new('Hearts', 'King'),
        Card.new('Hearts', 'Ace')
      ])
      expect(hand.evaluate).to eq(:straight_flush)
    end
  end

  describe '#evaluate' do
    it 'returns :four_of_a_kind for a four of a kind hand' do
      hand = Hand.new([
        Card.new('Hearts', '10'),
        Card.new('Diamonds', '10'),
        Card.new('Clubs', '10'),
        Card.new('Spades', '10'),
        Card.new('Hearts', 'Ace')
      ])
      expect(hand.evaluate).to eq(:four_of_a_kind)
    end
  end

  describe '#evaluate' do
  it 'returns :full_house for a full house hand' do
    hand = Hand.new([
      Card.new('Hearts', '10'),
      Card.new('Diamonds', '10'),
      Card.new('Clubs', '10'),
      Card.new('Spades', '9'),
      Card.new('Hearts', '9')
    ])
    expect(hand.evaluate).to eq(:full_house)
  end
end

  describe '#evaluate' do
    it 'returns :flush for a flush hand' do
      hand = Hand.new([
        Card.new('Hearts', '10'),
        Card.new('Hearts', 'Jack'),
        Card.new('Hearts', 'Queen'),
        Card.new('Hearts', 'King'),
        Card.new('Hearts', '2')
      ])
      expect(hand.evaluate).to eq(:flush)
    end
  end

  describe '#evaluate' do
    it 'returns :straight for a straight hand' do
      hand = Hand.new([
        Card.new('Diamonds', '10'),
        Card.new('Hearts', 'Jack'),
        Card.new('Hearts', 'Queen'),
        Card.new('Hearts', 'King'),
        Card.new('Hearts', 'Ace')
      ])
      expect(hand.evaluate).to eq(:straight)
    end
  end

  describe '#evaluate' do
    it 'returns :straight for a straight hand' do
      hand = Hand.new([
        Card.new('Diamonds', '2'),
        Card.new('Hearts', '3'),
        Card.new('Hearts', '4'),
        Card.new('Hearts', '5'),
        Card.new('Hearts', 'Ace')
      ])
      expect(hand.evaluate).to eq(:straight)
    end
  end

  describe '#evaluate' do
    it 'returns :three_of_a_kind for a three of a kind hand' do
      hand = Hand.new([
        Card.new('Hearts', '10'),
        Card.new('Diamonds', '10'),
        Card.new('Clubs', '10'),
        Card.new('Spades', '9'),
        Card.new('Hearts', '8')
      ])
      expect(hand.evaluate).to eq(:three_of_a_kind)
    end
  end

  describe '#evaluate' do
    it 'returns :two_pair for a two pair hand' do
      hand = Hand.new([
        Card.new('Hearts', '10'),
        Card.new('Diamonds', '10'),
        Card.new('Clubs', '9'),
        Card.new('Spades', '9'),
        Card.new('Hearts', '8')
      ])
      expect(hand.evaluate).to eq(:two_pair)
    end
  end

  describe '#evaluate' do
    it 'returns :pair for a pair hand' do
      hand = Hand.new([
        Card.new('Hearts', '10'),
        Card.new('Diamonds', '10'),
        Card.new('Clubs', '7'),
        Card.new('Spades', '9'),
        Card.new('Hearts', '8')
      ])
      expect(hand.evaluate).to eq(:pair)
    end
  end
end
