class StaticPagesController < ApplicationController
  def home
    @vehicles = Vehicle.select(:id, :name, :price, :description).last Settings.newest_vehicle
  end
end
