class PropertiesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update]

  def new
    @property = Property.new
  end

  def index
    if user_signed_in?
      @properties = current_user.properties
    else
      @properties = Property.all
    end
  end


  def create
    @property = Property.new(property_params)
    @property.user = current_user
    if @property.save
      flash[:notice] = "Congratulations! You've just listed your property!"
      redirect_to properties_path
    else
      flash[:alert] = "Your property could not be saved!"
      render :new
    end
  end

  def update

  end

private


  def property_params
    params.require(:property).permit(:user_id, :name, :description, :bedrooms, :bathrooms, :address, :city, :state,  :zip, :details)
  end
end

