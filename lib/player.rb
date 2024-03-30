class Player
  attr_reader :name, :chips, :hand

  def initialize(name, chips)
    @name = name
    @chips = chips
  end

  def receive_hand(hand)
    @hand = hand
  end

  def discard(*indices, deck)
    return unless @hand

    cards_to_discard = indices.map { |index| @hand.cards[index] }
    new_cards = deck.deal(cards_to_discard.length)

    cards_to_discard.each { |card| @hand.cards.delete(card) }
    @hand.cards.concat(new_cards)
  end

  def fold
    @hand = nil
  end

  def to_s
    "Player: #{@name}, Hand: #{@hand}, Chips: #{@chips}"
  end
end
