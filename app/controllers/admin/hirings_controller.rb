class Admin::HiringsController < ApplicationController
  layout "admin/application"

  def index
    @hirings = Hiring.search(params[:search]).reverse
  end
end
