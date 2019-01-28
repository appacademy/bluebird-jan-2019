class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end

    def show
        "cheese"
        # debugger
        user = User.find(params[:id])
        render json: user
    end 

    def create
        # user = User.new(
        #     username: params[:username],
        #     email: params[:email],
        #     age: params[:age]
        #     )

        user = User.new(user_params)

        if user.save
            render json: user
        else
            render json: user.errors.full_messages
        end
    end 

    def update
        user = User.find(params[:id])
        
        # debugger

        if user.update(user_params)
            render json: user
        else
            render json: user.errors.full_messages, status: 422
        end 
    end 
    
    def destroy
        user = User.find(params[:id])

        user.destroy
        render json: user
    end

    private

    # params = {"user"=>{"age"=>"440", "email"=>"dobby@he.io" ...}, "controller"=>"users", "action"=>"update", "id"=>"8"}

    def user_params
        params.require(:user).permit(:email, :username, :age)
    end 
end