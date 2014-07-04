class PropertiesController < ApplicationController
  def new
    @property = Property.new
  end

  def index
    "hello world"
  end

end
