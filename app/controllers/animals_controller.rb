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
    @regions = Region.all
    render :index
  end

  def edit
    @animal = Animal.find(params[:id])
    render :edit
  end

  def show
    @animal = Animal.find(params[:id])
    if params[:date1] != nil
      @sighting = Sighting.where(date_of_sighting: (params[:date1])..(params[:date2]))
    else
      @sighting = @animal.sightings
    end
    render :show
  end


  def update
    @animal= Animal.find(params[:id])
    if @animal.update(animal_params)
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
    params.require(:animal).permit(:name)
  end

end