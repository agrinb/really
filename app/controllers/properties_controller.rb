class PropertiesController < ApplicationController
  def new
    @property = Property.new
  end

  def index
    "new house"
  end

end
