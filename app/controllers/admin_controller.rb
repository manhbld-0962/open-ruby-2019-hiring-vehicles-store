class AdminController < ApplicationController
  layout "admin/application"
  before_action :verify_admin

  def index; end

  private

  def verify_admin
    return if current_user&.admin?
    flash[:danger] = t ".access_denied"
    redirect_to root_path
  end
end
