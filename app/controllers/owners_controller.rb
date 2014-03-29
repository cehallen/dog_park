class OwnersController < ApplicationController

  def index
    @owners = Owner.order(created_at: :asc)
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save  
      redirect_to owners_path, 
        notice: 'Dog owner created!'
    else
      render :new
    end
  end

  # def show
  #   @owner = Owner.find(params[:id])
  # end

  private

  def owner_params
    params.require(:owner)
      .permit(:first_name, :last_name, :dog_name, :email)
  end
end
