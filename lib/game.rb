require_relative 'player'
require_relative 'deck'

class Game
  attr_reader :players, :deck, :pot

  def initialize(*players_info)
    @players = players_info.map { |name, chips| Player.new(name, chips) }
    @deck = Deck.new
    @pot = 0
  end

  def deal_initial_hands
    @players.each do |player|
      player.receive_hand(@deck.deal(5))
    end
  end

  def discard_and_deal(player, *card_indices)
    player.discard(*card_indices)
    discarded_count = card_indices.size
    num_cards_to_deal = [discarded_count, @deck.cards.length].min
    replacement_cards = @deck.deal(num_cards_to_deal)
    player.receive_hand(replacement_cards)
  end


  def add_to_pot(amount)
    @pot += amount
  end

  def reset_pot
    @pot = 0
  end
end
