class WorkersController < ApplicationController
  def index
    @q = Worker.ransack(params[:q])
    workers = if params[:q].present? && params[:q].values.any?(&:present?)
                @q.result(distinct: true)
              else
                Worker.none
              end
    @pagy, @workers = pagy(workers, items: 10, size: 5)
  end
end
