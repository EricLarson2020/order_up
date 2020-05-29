class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes


  def list_ingredients
    #  Ingredient.joins(:dishes).select(:name).distinct

    all_dishes = []
    dishes.each do |dish|
      dish.ingredients.each do |ingredient|
        all_dishes << ingredient.name
      end
    end
    all_dishes.uniq.join(", ")
   end


  def most_popular_ingredients
    ingredient_hash = Ingredient.joins(:dishes).group(:name).count
    # top_three = ingredient_hash.map do |key, value|
    #   values.max(3)
    #
    #  end

    ingredient_hash
    binding.pry
  end
end
