class RestaurantsController < ApplicationController

    def index
        @restaurants = Restaurant.all
    end

    def show
        @restaurant = Restaurant.where(:'city' => params[:location]).first
    end

    def new
        @restaurant = Restaurant.new
    end

    def edit
        @restaurant = Restaurant.where(:'city' => params[:location]).first
    end

    def create
        @restaurant = Restaurant.new(restaurant_params)
        if @restaurant.save
            redirect_to restaurants_path, notice: "successfully added"
        else
            render action: 'new', alert: 'Location failed to save.'
        end
    end

    def save
        @restaurant = Restaurant.where(:'city' => params[:location]).first
        puts restaurant_params
        if @restaurant.update(restaurant_params)
            redirect_to restaurant_path(:location => params[:location])
        else
            render action: 'edit', alert: 'Changes failed to save.'
        end
    end

    def destroy
    end

    private

        def restaurant_params
            params.require(:restaurant)
            .permit(:name, :address, :city, :state, :zip, :phone, :email, :menu_item_ids => [])
        end

end
