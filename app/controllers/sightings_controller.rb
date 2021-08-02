class SightingsController < ApplicationController

  def new
    @animal = Animal.find(params[:animal_id])
    @sighting = @animal.sightings.new
    render :new
  end

  def create
    @animal = Animal.find(params[:animal_id])
    @sighting = @animal.sightings.new(sighting_params)
    if @sighting.save
      redirect_to animal_path(@animal)
    else
      render :new
  end

  def index

  end

  def edit
    @animal = Animalrtist.find(params[:animal_id])
    @sighting = Sighting.find(params[:id])
    render :edit
  end

  def show
    @animal = Animal.find(params[:animal_id])
    @sighting = Sighting.find(params[:id])
    render :show
  end

  def update
    @sighting = Sighting.find(params[:id])
    if @sighting.update(sighting_params)
      redirect_to animal_path(@sighting.animal)
    else
      @animal = Animal.find(params[:animal_id])
      render: edit 
    end
  end

  def destroy
    @sighting = Sighting.find(params[:id])
    @sighting.destroy
    redirect to animal_path(@sighting.animal)
  end

  private
  def sighting_params
    params.require(:sightings).permit(:longitude, :latitude, :date)
  end

end