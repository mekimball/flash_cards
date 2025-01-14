require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
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

  it 'is a round' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    expect(card_1).to be_instance_of(Card)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    expect(card_2).to be_instance_of(Card)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    expect(card_3).to be_instance_of(Card)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    expect(Round.new(deck)).to be_a(Round)
  end

  it 'returns a deck' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    expect(card_1).to be_instance_of(Card)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    expect(card_2).to be_instance_of(Card)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    expect(card_3).to be_instance_of(Card)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    expect(round.deck).to eq(deck)
end
  it 'is an array' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    expect(card_1).to be_instance_of(Card)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    expect(card_2).to be_instance_of(Card)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    expect(card_3).to be_instance_of(Card)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    expect(round.turns).to eq([])
  end
  it 'returns a card' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    expect(card_1).to be_instance_of(Card)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    expect(card_2).to be_instance_of(Card)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    expect(card_3).to be_instance_of(Card)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    expect(round.current_card).to eq(card_1)
    current_card = cards.shift
    expect(round.current_card).to eq(card_2)
    current_card = cards.shift
    expect(round.current_card).to eq(card_3)
  end
  it 'takes a turn' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    expect(card_1).to be_instance_of(Card)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    expect(card_2).to be_instance_of(Card)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    expect(card_3).to be_instance_of(Card)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    expect(new_turn).to be_a(Turn)
    # expects the turn to be true
    expect(new_turn.correct?).to eq(true)
    # expects round.turn to move to a new turn
    expect(round.turns).to eq([new_turn])
    # expects the number correct to be 1
    expect(round.number_correct).to eq(1)
    # expects it to go to the next card
    expect(round.current_card).to eq(card_2)
    #adds a new turn
    new_turn = round.take_turn("Venus")
    #new turn is a turn
    expect(new_turn).to be_a(Turn)
    # expects turn count to be 2
    expect(round.turns.count).to eq(2)
    # checks that the answer is wrong
    expect(round.turns.last.feedback).to eq("Incorrect!")
    # expects the correct answers to be 1
    expect(round.number_correct).to eq(1)
    # expects number of geography questions correct to be 1
    expect(round.number_correct_by_category(:Geography)).to eq(1)
    # expects STEM correct answers to be 0
    expect(round.number_correct_by_category(:STEM)).to eq(0)
    # checks percentage correct
    expect(round.percent_correct).to eq(50.0)
    # checks percentage correct by category
    expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
    # expects to be on card 3
    expect(round.current_card).to eq(card_3)
  end

end
