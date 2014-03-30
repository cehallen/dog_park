class DogsController < ApplicationController
  def index
    @dogs = Dog.order(created_at: :asc)
  end

  def new
    @dog = Dog.new
    @owners = Owner.all.map{ |o| [o.full_name, o.id] }
  end

  def create
    @dog = Dog.new(params.require(:dog).permit(:owner_id, 
      :name, :breed))
    if @dog.save
      redirect_to dogs_path,
        notice: 'Dog entry created!'
    else
      @owners = Owner.all.map{ |o| [o.full_name, o.id] }
      render :new
    end
  end

  def show
    @dog = Dog.find(params[:id])
  end
end