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
    context "when the player has a hand" do
      let(:dealt_cards) { [Card.new('Hearts', 'Ace'), Card.new('Diamonds', '10'), Card.new('Clubs', '8')] }

      before do
        allow(hand).to receive(:cards).and_return(dealt_cards)
        player.receive_hand(hand)
      end

      it "removes specified cards from the player's hand" do
        player.discard(0, 2)
        expect(player.hand.cards.size).to eq(1)
      end
    end

    context "when the player has no hand" do
      it "does nothing" do
        expect { player.discard(0, 1, 2) }.not_to raise_error
      end
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
