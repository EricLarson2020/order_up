require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "instance_methods" do
    it "list_ingredients" do
      bob = Chef.create({name: "Bob"})
      dish_1 = bob.dishes.create({name: "Pizza", description: "Italian Food"})
      dish_2 = bob.dishes.create({name: "Spagetti", description: "Noodles with sauce"})
      ingredient_1 = Ingredient.create({name: "flour", calories: 100})
      ingredient_2 = Ingredient.create({name: "tomato", calories: 50})
      ingredient_3 = Ingredient.create({name: "noodles", calories: 200})

      dish_1.ingredients << ingredient_1
      dish_1.ingredients << ingredient_2
      dish_2.ingredients << ingredient_2
      dish_2.ingredients << ingredient_3

      expect(bob.list_ingredients).to eql("flour, tomato, noodles")
    end
  end


end
