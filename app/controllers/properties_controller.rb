class PropertiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])

    @property = Property.new
  end

  def index
    "hello world"
  end

  def property_params
    params.require(:property).permit(:user_id, :name, :description, :bedrooms, :bathrooms, :address, :city, :state,  :zip, :details)
  end
end

