class HiringsController < ApplicationController
  before_action :logged_in_user, only: %i(new create)

  def new
    @hiring = Hiring.new
  end

  def create
    @hiring = current_user.hirings.build hiring_params
    vehicle = @hiring.vehicle

    if @hiring.save
      vehicle.decrement! :quantity
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
