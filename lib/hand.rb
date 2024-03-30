require_relative 'deck'

class Hand
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def evaluate
    return :straight_flush if straight_flush?
    return :four_of_a_kind if four_of_a_kind?
    return :full_house if full_house?
    return :flush if flush?
    return :straight if straight?
    return :three_of_a_kind if three_of_a_kind?
    return :two_pair if two_pair?
    return :pair if pair?

    :high_card
  end

  private

  def card_values
    @cards.map(&:value)
  end

  def card_suits
    @cards.map(&:suit)
  end

  def rank_counts
    card_values.tally
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    rank_counts.values.include?(4)
  end

  def full_house?
    rank_counts.values.sort == [2, 3]
  end

  def flush?
    card_suits.uniq.length == 1
  end

  def straight?
    values = card_values.map { |value| Deck::VALUES.index(value) }
    values.sort!
    return true if values == [0, 1, 2, 3, 12] # Ace-high straight (A, 2, 3, 4, 5)
    (0..3).each { |i| return false unless values[i + 1] == values[i] + 1 }
    true
  end

  def three_of_a_kind?
    rank_counts.values.include?(3)
  end

  def two_pair?
    rank_counts.values.count(2) == 2
  end

  def pair?
    rank_counts.values.include?(2)
  end
end
