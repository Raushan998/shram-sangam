class LeadsController < ApplicationController
    def create
        @lead = Lead.new(lead_params)
        if @lead.save
            respond_to do |format|
                format.html { redirect_to root_path, notice: "Thank you for your enquiry!" }
                format.json { head :ok }
            end
        end
    rescue StandardError => e
        render json: { error: e.message }, status: :unprocessable_entity
    end

    private
    def lead_params
        params.require(:lead).permit(:phone_number, :name, :message)
    end
end
