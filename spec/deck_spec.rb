require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    expect(card_1).to be_instance_of(Card)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    expect(card_2).to be_instance_of(Card)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    expect(card_3).to be_instance_of(Card)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    expect(deck).to be_a(Deck)
  end
  it "has readable attributes" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    expect(card_1).to be_instance_of(Card)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    expect(card_2).to be_instance_of(Card)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    expect(card_3).to be_instance_of(Card)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    expect(deck.cards).to eq([card_1, card_2, card_3])
  end
  it "can be counted" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    expect(card_1).to be_instance_of(Card)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    expect(card_2).to be_instance_of(Card)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    expect(card_3).to be_instance_of(Card)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    expect(deck.count).to eq(3)
  end
  it 'has a category' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    expect(card_1).to be_instance_of(Card)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    expect(card_2).to be_instance_of(Card)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    expect(card_3).to be_instance_of(Card)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    expect(deck.cards_in_category(:Geography)).to eq([card_1])
    expect(deck.cards_in_category("Pop Culture")).to eq([])
  end
end
