class HiringsController < ApplicationController
  before_action :logged_in_user, only: %i(new create)

  def new
    @hiring = Hiring.new
    @vehicle = Vehicle.find_by id: params[:vehicle_id]
    return if @vehicle
    flash[:danger] = t ".cant_find"
    redirect_to root_url
  end

  def create
    @hiring = current_user.hirings.build hiring_params
    vehicle = @hiring.vehicle
    if @hiring.save
      vehicle.decrement! :quantity
      @hiring.update_attributes give_back_time: @hiring.created_at + @hiring.time.hours
      BillingWorker.perform_async(@hiring.id, current_user.id)
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".fails"
    end
    redirect_to root_path
  end

  private

  def hiring_params
    params.require(:hiring).permit Hiring::HIRING_PARAMS
  end
end
