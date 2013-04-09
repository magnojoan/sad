class AdjustmentsController < ApplicationController
  before_filter :authenticate_user!

  def index
   @adjustments = Adjustment.all
  end

  def show
    @adjustment = Adjustment.find(params[:id])
  end

  def new
    @adjustment = Adjustment.new
  end

  def create
    @adjustment = Adjustment.create(params[:adjustment])
    if @adjustment.save
      redirect_to adjustments_path
    else
      render :new
    end
  end

  def edit
    @adjustment = Adjustment.find(params[:id])
  end

  def update
    @adjustment = Adjustment.find(params[:id])
    if @adjustment.update_attributes(params[:adjustment])
      redirect_to adjustments_path
    else
      render :edit
    end
  end

  def destroy
    @adjustment = Adjustment.find(params[:id])
    @adjustment.destroy
    redirect_to adjustments_path
  end
    
end
