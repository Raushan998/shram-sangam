class WorkersController < ApplicationController
    def index
      if params[:q].present? && params[:q].values.any?(&:present?)
        @q = Worker.ransack(params[:q])
        @workers = @q.result(distinct: true)
      else
        @q = Worker.ransack
        @workers = []
      end
    end
end
  