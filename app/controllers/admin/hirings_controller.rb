class Admin::HiringsController < ApplicationController
  layout "admin/application"
  before_action :find_hiring, only: %i(edit update)

  def index
    @q = Hiring.ransack params[:q]
    @hirings = @q.result.page(params[:page]).per Settings.per_page
    @selects = Hiring.statuses.keys
  end

  def edit
    @statuses = Hiring.statuses
  end

  def update
    if @hiring.update_attributes hiring_params
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".fails"
    end
    redirect_to admin_hirings_path
  end

  private

  def hiring_params
    params.require(:hiring).permit Hiring::HIRING_UPDATE_PARAMS
  end

  def find_hiring
    @hiring = Hiring.find_by id: params[:id]

    return if @hiring
    flash[:danger] = t ".cant_find"
    redirect_to admin_hirings_path
  end
end
