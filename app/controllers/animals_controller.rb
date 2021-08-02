class AnimalsController < ApplicationController

  def new
    @animal = Animal.new
    render :new
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      redirect_to animals_path
    else
      render :new
    end
  end

  def index
    @animals = Animal.all
    render :index
  end

  def edit
    @animal = Animal.find(params[:id])
    render :edit
  end

  def show
    @animal = Animals.find(params[:id])
    render :show
  end


  def update
    @animal= Animals.find(params[:id])
    if @animal.update(animal)
      redirect_to animals_path
    else
      render :edit
    end
  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
    redirect_to animals_path
  end

  private
  def animal_params
    params.require(:animal).permit(:name, :genre)
  end

  
end