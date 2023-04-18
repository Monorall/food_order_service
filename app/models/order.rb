class Order < ApplicationRecord
  has_many :order_ingredients
  has_many :excluded_ingredients, through: :order_ingredients, source: :ingredient

  def self.generate_kitchen_menu
    dishes = Dish.all.includes(:ingredients)
    orders = includes(:excluded_ingredients).all

    menu = dishes.map do |dish|
      count = orders.count { |order| (dish.ingredients & order.excluded_ingredients).empty? }
      { name: dish.name, count: count }
    end

    menu.sort_by { |dish| -dish[:count] }
  end
end
