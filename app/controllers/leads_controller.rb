class LeadsController < ApplicationController
    def create
        @lead = Lead.create!(lead_params)
        render json: { message: "Lead has been created successfully!" }, status: :ok
    rescue StandardError => e
        render json: { error: e.message }, status: :unprocessable_entity
    end

    private
    def lead_params
        params.require(:lead).permit(:phone_number)
    end
end
