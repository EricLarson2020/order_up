class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes


  def list_ingredients

  
    all_dishes = []
    dishes.each do |dish|
      dish.ingredients.each do |ingredient|
        all_dishes << ingredient.name
      end
    end
    all_dishes.uniq.join(", ")
   end
end
