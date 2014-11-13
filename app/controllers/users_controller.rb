class UsersController < ApplicationController
    # skip_before_filter :authorize
    before_action :set_user, only: [:show, :edit, :save, :destroy]

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to restaurants_path, notice: 'User was successfully created.'
        else
            render action: 'new', alert: 'Unsuccessfully saved.'
        end
    end

    def edit
    end

    def show
    end

    def save
        if @user.update(user_params)
            redirect_to users_path
        else
            render action: 'edit', alert: 'Unsuccessfully saved.'
        end
    end

    def destroy
        @user.destroy
    end

    private
        def set_user
          @user = User.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def user_params
          params.require(:user).permit(:email, :first_name, :last_name, :phone, :password, :password_confirmation)
        end
end