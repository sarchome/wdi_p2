class MenuItemsController < ApplicationController

    def index
        @menu_items = MenuItem.all
    end

    def new
        @menu_item = MenuItem.new
        # CHANGE TO ATTACH TO RESTAURANT
    end

    def create
        @menu_item = MenuItem.new(menu_item_params)
        if @menu_item.save
            redirect_to action: 'index', notice: 'Item successfully added.'

        else
            render action: 'new', alert: 'failed to add.'
        end 
    end

    def show_location
        @restaurant = Restaurant.where(:'city' => params[:location]).first
    end

    def show_one
        # restaurant = Restaurant.where(:'city' => params[:location]).first
        @menu_item = MenuItem.find(params[:id])
    end

    def edit
        # @restaurant = Restaurant.where(:'city' => params[:location]).first
        @menu_item = MenuItem.find(params[:id])
    end

    def save
        @menu_item = MenuItem.find(params[:id])
        if @menu_item.update(menu_item_params)
            redirect_to menu_items_path, notice: 'item updated'
        else
            render action: 'edit', alert: 'try again.'
        end
    end

    private

        def menu_item_params
            params.require(:menu_item).permit(:item, :price, :category, :description, :restaurant_ids => [])
        end

end

