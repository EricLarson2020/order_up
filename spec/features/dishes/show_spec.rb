require "rails_helper"

RSpec.describe "Dishes Show Page", type: :feature do
  it "displays ingredients for dish and name of chef" do
    bob = Chef.create({name: "Bob"})
    dish_1 = bob.dishes.create({name: "Pizza", description: "Italian Food"})
    ingredient_1 = Ingredient.create({name: "flour", calories: 100})
    ingredient_2 = Ingredient.create({name: "tomato", calories: 50})
    dish_1.ingredients << ingredient_1
    dish_1.ingredients << ingredient_2

    visit "/dishes/#{dish_1.id}"
    expect(page).to have_content(ingredient_1.name)
    expect(page).to have_content(ingredient_2.name)
    expect(page).to have_content(bob.name)

  end

  it "displays total calorie count for a dish" do
    bob = Chef.create({name: "Bob"})
    dish_1 = bob.dishes.create({name: "Pizza", description: "Italian Food"})
    ingredient_1 = Ingredient.create({name: "flour", calories: 100})
    ingredient_2 = Ingredient.create({name: "tomato", calories: 50})
    dish_1.ingredients << ingredient_1
    dish_1.ingredients << ingredient_2
    visit "/dishes/#{dish_1.id}"
    expect(page).to have_content("Dish Calories: 150")


  end
end


# As a visitor
# When I visit a dish's show page
# I see a list of ingredients for that dish
# and the chef's name
