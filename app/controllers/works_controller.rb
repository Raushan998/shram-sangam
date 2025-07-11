class WorksController < ApplicationController
    before_action :set_work, only: %i[show]
    def index
      works_query = Work.includes(:addresses).order(created_at: :desc)
    
      works_query = works_query.where(work_type: params[:work_type]) if params[:work_type].present?
      works_query = works_query.where(category: params[:category]) if params[:category].present?
    
      if params[:city].present?
        works_query = works_query.joins(:addresses).where(addresses: { city: params[:city] })
      end
    
      @pagy, @works = pagy(works_query, limit: 15)
    end

    def new
      @work = Work.new
      @work.addresses.build
    end

    def create
      @work = Work.new(work_params)

      if @work.save
        redirect_to root_path, notice: "work.created_successfully"
      else
        @work.addresses.build unless @work.addresses.any?
        flash.now[:alert] = @work.errors.full_messages.to_sentence
        render :new, status: :unprocessable_entity
      end
    end

    def show
    end

    private

    def work_params
      params.require(:work).permit(
        :title,
        :description,
        :work_type,
        :budget_type,
        :post_visibility,
        :category,
        :required_workers,
        :budget_amount,
        :contact_person_name,
        :contact_person_phone_number,
        addresses_attributes: [
          :id,
          :street,
          :landmark,
          :city,
          :state,
          :postal_code,
          :country,
          :_destroy
        ]
      )
    end

    def set_work
      @work = Work.find(params[:id])
    end
end
