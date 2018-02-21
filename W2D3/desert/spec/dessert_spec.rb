require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Zi") }
  subject(:muffin) { Dessert.new("muffin", 10, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(muffin.type).to eq("muffin")
    end

    it "sets a quantity" do
      expect(muffin.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(muffin.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("muffin", 'str', chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      muffin.add_ingredient("flour")
      expect(muffin.ingredients).to include("flour")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["water", "flour", "sugar", "milk"]
      ingredients.each do |ingredient|
        muffin.add_ingredient(ingredient)
      end

      expect(muffin.ingredients).to eq(ingredients)
      muffin.mix!
      expect(muffin.ingredients).to_not eq(ingredients)
      expect(muffin.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(muffin.eat(5)).to eq(5)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {muffin.eat(20)}.to raise_error "not enough left!"
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Zi the Great Baker")
      expect(muffin.serve).to eq("Chef Zi the Great Baker has made 10 muffins!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(muffin)
      muffin.make_more
    end
  end
end
