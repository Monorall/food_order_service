class OrdersController < ApplicationController
  def new
    @ingredients = Ingredient.all
    @order = Order.new
  end

  def create
    @order = Order.new
    if params[:excluded_ingredients].present?
      params[:excluded_ingredients].each do |ingredient_id|
        @order.order_ingredients.build(ingredient_id: ingredient_id)
      end
    end

    if @order.save
      redirect_to root_path, notice: 'Заказ успешно создан!'
    else
      @ingredients = Ingredient.all
      render :new
    end
  end

  def kitchen
    @menu = Order.generate_kitchen_menu
  end
end
