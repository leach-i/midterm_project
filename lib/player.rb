require_relative 'hand'

class Player
  attr_reader :name, :chips, :hand

  def initialize(name, chips)
    @name = name
    @chips = chips
  end

  def receive_hand(hand)
    @hand = hand
  end

  def discard(*card_indices)
    return unless @hand

    card_indices.flatten.sort.reverse_each { |index| @hand.cards.delete_at(index) }
  end

  def fold
    @hand = nil
  end

  def to_s
    "Player: #{@name}, Hand: #{@hand}, Chips: #{@chips}"
  end
end
