class VehiclesController < ApplicationController
  def show
    @comment = Comment.new
    @vehicle = Vehicle.find_by id: params[:id]
    return if @vehicle
    flash[:danger] = t ".cant_find"
    redirect_to root_path
  end
end
