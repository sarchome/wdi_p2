class OrdersController < ApplicationController
    
    def add
        restaurant = Restaurant.find(params[:restaurant_id])
        item = MenuItem.find(params[:item_id])
        quantity = params[:quantity]
        order_id = session[:order_id]

        # creating new order
        if order_id.nil?
            order = new_order(current_user, restaurant)
        else
            begin
                order = Order.find(order_id)
            rescue Mongoid::Errors::DocumentNotFound
                order = new_order(current_user, restaurant)
            end
        end

        # adding item to order
        order_item = OrderMenuItem.new({menu_item: item, quantity: quantity})
        order.order_menu_items.push(order_item)

        if order.save
            redirect_to menu_path(location: restaurant.city), notice: 'item added'
        else
            redirect_to menu_path(location: restaurant.city), alert: 'add item fail'
        end

    end

    def view
        order_id = session[:order_id]
        @order = Order.find(order_id)
    end

    def submit
        order_id = session[:order_id]
        @order = Order.find(order_id)

        x = @order.update({status:'new', ordered_at: Time.now})
        if x
            redirect_to complete_order_path, notice: 'order submitted'
        else

            redirect_to submit_order_path, alert: 'order submit failed'
        end
    end

    def complete
        order_id = session[:order_id]
        @order = Order.find(order_id)
        @restaurant = @order.restaurant
    end

    private

    def new_order(current_user, restaurant)
        order = Order.new({created_at: Time.now, user: current_user, restaurant: restaurant})
        if !order.save
            redirect_to 'root'
            render 'new order fail'
        end
        session[:order_id] = order.id.to_s

        order
    end

end