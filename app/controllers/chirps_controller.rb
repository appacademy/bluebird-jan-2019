class ChirpsController < ApplicationController
    def create
        "cheese"
        # debugger
        chirp = Chirp.new(chirp_params)
        chirp.author_id = params[:user_id]


    end 

    def show
        chirp = Chirp.find(params[:id])
        render json: chirp
    end

    # Parameters: {"chirp"=>{"body"=>"\"Blimey, Harry!\""}, "user_id"=>"1"}

    private

    def chirp_params
        params.require(:chirp).permit(:body)
    end 
end 