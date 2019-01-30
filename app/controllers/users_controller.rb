class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def index
        @users = User.all
        # render json: users
    end

    def show
        # "cheese"
        # debugger
        @user = User.find(params[:id])
        # render :show # we don't need this line!
        # render json: user
    end

    def create
      debugger
        # user = User.new(
        #     username: params[:username],
        #     email: params[:email],
        #     age: params[:age]
        #     )

        @user = User.new(user_params)

        if @user.save
            login!(@user)
            redirect_to user_url(@user)
        else
            # render json: user.errors.full_messages
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def update
        user = User.find(params[:id])

        # debugger

        if user.update(user_params)
            # render json: user
            redirect_to user_url(user)
        else
            render json: user.errors.full_messages, status: 422
        end
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        # render json: user
        redirect_to users_url
    end

    private

    # params = {"user"=>{"age"=>"440", "email"=>"dobby@he.io" ...}, "controller"=>"users", "action"=>"update", "id"=>"8"}

    def user_params
        # debugger
        params.require(:user).permit(:email, :username, :political_affiliation, :age, :password)
    end
end
