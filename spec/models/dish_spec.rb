require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "instance_methods" do
    it "total_calories" do
      bob = Chef.create({name: "Bob"})
      dish_1 = bob.dishes.create({name: "Pizza", description: "Italian Food"})
      ingredient_1 = Ingredient.create({name: "flour", calories: 100})
      ingredient_2 = Ingredient.create({name: "tomato", calories: 50})
      dish_1.ingredients << ingredient_1
      dish_1.ingredients << ingredient_2

      expect(dish_1.total_calories).to eql(150)
    end
  end
end
