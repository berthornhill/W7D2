class BandsController < ApplicationController

    def index
        @bands = Band.all
        render :index
    end
    
    def new
        render :new
    end


    def show
        @band = Band.find(params[:id])
        render :show
    end

    def create
        @band  = Band.new(params[:name])
        if @band.save 
            redirect_to band_url(@band)
        else
            flash.now[:errors] = @band.errors.full_messages
            redirect_to new_band_url
        end
    end

    def edit

    end

    def destroy
        @band = Band.find_by(params[:id])
        @band.destroy
        redirect_to bands_url
    end

end
