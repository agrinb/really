class PropertiesController < ApplicationController
  before_action :set_user, only: [:new, :create]

  def new
    @user = User.find(params[:user_id])
    @property = Property.new
  end

  def index
    "hello world"
  end

  def create
    @property = Property.new(property_params)
    @property.user_id = set_user.id
        binding.pry
    if @property.save
      flash[:notice] = "Congratulations! You've just listed your property!"
    else
      flash[:alert] = "Your property could not be saved!"
    end
  end

private
  def set_user
    @user = User.find(params[:user_id])
  end


  def property_params
    params.require(:property).permit(:user_id, :name, :description, :bedrooms, :bathrooms, :address, :city, :state,  :zip, :details)
  end
end

