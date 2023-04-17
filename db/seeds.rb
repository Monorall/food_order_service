require 'yaml'

# Загрузка и добавление ингредиентов (как ранее)
file_path = Rails.root.join('db', 'ingredients.yml')
ingredients_data = YAML.load_file(file_path)

ingredients_data.each do |ingredient|
  Ingredient.create!(ingredient)
end

# Загрузка и добавление блюд
file_path = Rails.root.join('db', 'dishes.yml')
dishes_data = YAML.load_file(file_path)

dishes_data.each do |dish_data|
  dish = Dish.create!(name: dish_data["name"])
  dish_data["ingredients"].each do |ingredient_name|
    ingredient = Ingredient.find_by(name: ingredient_name)
    dish.ingredients << ingredient if ingredient.present?
  end
end