class BusinessController < ApplicationController
    before_action :set_business, only: [:show]
    def index
        @business = Business.where(city: params[:city])
        @pagy, @business = pagy(@business, items: 10, size: 5)
    end

    def show 
    end

    private
    def set_business
        @business = Business.find(params[:id])
    end
end
