require '../lib/player'

RSpec.describe Player do
  let(:player_name) { "John" }
  let(:starting_chips) { 100 }
  let(:player) { Player.new(player_name, starting_chips) }
  let(:hand) { double("Hand") }
  let(:deck) { double("Deck") }

  describe "#initialize" do
    it "creates a player with the given name and starting chips" do
      expect(player.name).to eq(player_name)
      expect(player.chips).to eq(starting_chips)
    end
  end

  describe "#receive_hand" do
    it "sets the player's hand" do
      player.receive_hand(hand)
      expect(player.hand).to eq(hand)
    end
  end

  describe "#discard" do
    it "removes specified cards from the player's hand and replaces them" do
      cards_to_discard = [0, 1]
      new_cards = [Card.new('Hearts', 'King'), Card.new('Diamonds', '10')]  # Example replacement cards
      allow(deck).to receive(:deal).with(cards_to_discard.length).and_return(new_cards)
      player.receive_hand(hand)
      player.discard(*cards_to_discard, deck)
      expect(player.hand.cards).not_to eq(hand.cards)
    end

    it "does nothing if the player has no hand" do
      expect { player.discard(0, 1, deck) }.not_to raise_error
    end
  end


  describe "#fold" do
    it "sets the player's hand to nil" do
      player.receive_hand(hand)
      player.fold
      expect(player.hand).to be_nil
    end
  end

  describe "#to_s" do
    it "returns a string representation of the player" do
      expected_string = "Player: #{player_name}, Hand: #{hand}, Chips: #{starting_chips}"
      player.receive_hand(hand)
      expect(player.to_s).to eq(expected_string)
    end
  end
end
