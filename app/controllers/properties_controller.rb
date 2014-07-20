class PropertiesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :show]

  def new
    @property = Property.new
  end

  def edit
    @property = Property.find(params[:id])
  end

  def index
    if user_signed_in?
      @properties = current_user.properties
      @appointments = @properties.map do |prop|
        if !prop.appointments.empty?
          prop.appointments
        end
      end
      @appointments.flatten!
      binding.pry
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

  def show
    @property = Property.find(params[:id])
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
      redirect_to properties_path
  end



private


  def property_params
    params.require(:property).permit(:user_id, :name, :description, :photo, :bedrooms, :bathrooms, :address, :city, :state,  :zip_code, :details)
  end
end

