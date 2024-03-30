require '../lib/game'

RSpec.describe Game do
  let(:player1_name) { "Alice" }
  let(:player2_name) { "Bob" }
  let(:player3_name) { "Charlie" }

  let(:player1_chips) { 100 }
  let(:player2_chips) { 150 }
  let(:player3_chips) { 200 }

  let(:game) { Game.new([player1_name, player1_chips], [player2_name, player2_chips], [player3_name, player3_chips]) }

  describe "#initialize" do
    it "creates players with the given names and initial chips" do
      expect(game.players.size).to eq(3)
      expect(game.players.map(&:name)).to contain_exactly(player1_name, player2_name, player3_name)
      expect(game.players.map(&:chips)).to contain_exactly(player1_chips, player2_chips, player3_chips)
    end

    it "creates a deck" do
      expect(game.deck).to be_a(Deck)
    end

    it "initializes the pot to 0" do
      expect(game.pot).to eq(0)
    end
  end

  describe "#add_to_pot" do
    it "adds the specified amount to the pot" do
      game.add_to_pot(50)
      expect(game.pot).to eq(50)
    end
  end

  describe "#reset_pot" do
    it "resets the pot to 0" do
      game.add_to_pot(50)
      game.reset_pot
      expect(game.pot).to eq(0)
    end
  end
end
