require "rails_helper"

RSpec.describe "Chefs Show Page", type: :feature do
  it "displays chefs name and a link to the list of all unique ingredients used by chef" do
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

    visit "/chefs/#{bob.id}"
    expect(page).to have_content("Chef's Name: Bob")
    click_link("See Ingredients")
    expect(current_path).to eql("/chefs/#{bob.id}/ingredients")
    expect(page).to have_content(ingredient_1.name, count: 1)
    expect(page).to have_content(ingredient_2.name, count: 1)
    expect(page).to have_content(ingredient_3.name, count: 1)
  end
end



# As a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses
