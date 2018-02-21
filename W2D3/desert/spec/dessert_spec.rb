require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  # subject(:brownie) { Dessert.new("brownie")}
  let(:chef) { double("chef", name: "Jiro") }
  let(:brownie) { Dessert.new("brownie", 100, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("brownie")
    end
    it "sets a quantity" do
      expect(brownie.quantity).to eq(100)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("brownie", "str", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(brownie.ingredients).to_not include('flour')
      brownie.add_ingredient('flour')
      expect(brownie.ingredients).to include('flour')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      # brownie.ingredients = ["water", "flour", "sugar"]

      ingredients = ["water", "flour", "sugar"]

      ingredients.each do |ingredient|
        brownie.add_ingredient(ingredient)
      end

      expect(brownie.ingredients).to eq(ingredients)
      brownie.mix!
      expect(brownie.ingredients).to_not eq(ingredients)
      expect(brownie.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(brownie.eat(1)).to eq(99)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {brownie.eat(101)}.to raise_error "not enough left!"
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      # expect (brownie.serve).to include("titleize")
      allow(chef).to receive(:titleize).and_return("Chef Jiro the Great Baker")
      expect(brownie.serve).to eq("Chef Jiro the Great Baker has made 100 brownies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(brownie)
      brownie.make_more
    end
  end
end
