require_relative 'card'
require_relative 'deck'
require_relative'hand'
require_relative 'player'
require_relative 'game'

class PokerGame
  attr_reader :game

  def initialize(*players_info)
    @game = Game.new(*players_info)
  end

  def start_round
    @game.deck.shuffle
    @game.deal_initial_hands

    @game.players.each do |player|
      puts "#{player.name}'s Hand: #{player.hand.map { |card| "#{card.value} of #{card.suit}" }.join(', ')}"
    end

    @game.players.each do |player|
      puts "#{player.name}, do you want to discard any cards? (Enter indices separated by commas or 'none' to keep all)"
      input = gets.chomp.downcase

      if input == 'none'
        next
      else
        card_indices = input.split(',').map(&:to_i)
        @game.discard_and_deal(player, *card_indices)
      end

      puts "#{player.name}'s New Hand: #{player.hand.map { |card| "#{card.value} of #{card.suit}" }.join(', ')}"
    end

    winners = determine_winner
    if winners.size > 1
      puts "It's a tie between #{winners.map(&:name).join(' and ')}!"
    else
      puts "#{winners.first.name} wins!"
    end

    @game.reset_pot
  end

  def determine_winner
    winners = []
    best_hand = nil

    @game.players.each do |player|
      hand_type = player.hand.evaluate
      if best_hand.nil? || Hand::VALUES.index(hand_type.to_s) > Hand::VALUES.index(best_hand.to_s)
        best_hand = hand_type
        winners = [player]
      elsif Hand::VALUES.index(hand_type.to_s) == Hand::VALUES.index(best_hand.to_s)
        winners << player
      end
    end

    winners
  end
end

game = PokerGame.new(['Player 1', 100], ['Player 2', 100])
game.start_round
