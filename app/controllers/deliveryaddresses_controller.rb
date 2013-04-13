class DeliveryaddresssController < ApplicationController
  before_filter :authenticate_user!

  def index
   @deliveryaddresss = Deliveryaddress.all
  end

  def show
    @deliveryaddress = Deliveryaddress.find(params[:id])
  end

  def new
    @deliveryaddress = Deliveryaddress.new
  end

  def create
    @deliveryaddress = Deliveryaddress.create(params[:deliveryaddress])
    if @deliveryaddress.save
      redirect_to deliveryaddresss_path
    else
      render :new
    end
  end

  def edit
    @deliveryaddress = Deliveryaddress.find(params[:id])
  end

  def update
    @deliveryaddress = Deliveryaddress.find(params[:id])
    if @deliveryaddress.update_attributes(params[:deliveryaddress])
      redirect_to deliveryaddresss_path
    else
      render :edit
    end
  end

  def destroy
    @deliveryaddress = Deliveryaddress.find(params[:id])
    @deliveryaddress.destroy
    redirect_to deliveryaddresss_path
  end
    
end
