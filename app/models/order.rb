class Order < ApplicationRecord
  has_many :order_ingredients
  has_many :excluded_ingredients, through: :order_ingredients, source: :ingredient

  def self.generate_kitchen_menu
    dishes = Dish.all.includes(:ingredients)
    orders = includes(:excluded_ingredients).all

    # Создаем хэш для подсчета блюд, подходящих для заказа
    dish_counter = Hash.new(0)

    orders.each do |order|
      # Находим подходящие блюда для каждого заказа
      suitable_dishes = dishes.select { |dish| (dish.ingredients & order.excluded_ingredients).empty? }

      # Увеличиваем счетчик для каждого подходящего блюда
      suitable_dishes.each { |dish| dish_counter[dish.name] += 1 }
    end

    # Преобразуем хэш в массив и сортируем его по убыванию количества подходящих заказов
    menu = dish_counter.map { |name, count| { name: name, count: count } }.sort_by { |dish| -dish[:count] }
  end
end
