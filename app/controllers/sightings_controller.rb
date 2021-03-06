class SightingsController < ApplicationController

  def new
    @animal = Animal.find(params[:animal_id])
    @sighting = @animal.sightings.new
    @regions = Region.all
    render :new
  end

  def create
    @animal = Animal.find(params[:animal_id])
    @sighting = @animal.sightings.new(sighting_params)
    @sighting.update({:region_id => params[:region_id]})
    if @sighting.save
      redirect_to animal_path(@animal)
    else
      render :new
    end
  end

  def edit
    @animal = Animal.find(params[:animal_id])
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
      render :edit
    end
  end

  def destroy
    @sighting = Sighting.find(params[:id])
    @sighting.destroy
    redirect_to animal_path(@sighting.animal)
  end

  private
  def sighting_params
    params.require(:sighting).permit(:longitude, :latitude, :date_of_sighting, :region_id)
  end

end