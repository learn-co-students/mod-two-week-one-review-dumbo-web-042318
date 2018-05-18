class SeasController < ApplicationController
  #define your controller actions here
  before_action :set_sea, only: [:show, :edit, :update, :destroy]

  def welcome
  end

  def index
    @seas = Sea.all
  end

  def new
    @sea = Sea.new
  end

  def show
  end

  def create
    sea = Sea.new(sea_params)

    if sea.save
      redirect_to sea_path(sea) # students/:id
    else
      redirect_to new_sea_path # students/new
    end
    # post "/seas" do
    #   @sea = Sea.new(params)
    #   @sea.save
    #   redirect to "/seas/#{@sea.id}"
    # end
  end

  def edit
  end

  def update
    if @sea.update(sea_params)
      redirect_to sea_path(@sea)
    else
      redirect_to edit_sea_url # students/:id/edit
    end
    # post "/seas/:id" do
    #   @sea = Sea.find(params[:id])
    #   params[:has_mermaids] ||= false
    #   @sea.update(params)
    #   redirect to "/seas/#{@sea.id}"
    # end
  end

  def destroy
    @sea.destroy

    redirect_to sea_path
    # post "/seas/:id/delete" do
    #   @sea = Sea.find(params[:id])
    #   @sea.destroy
    #   redirect to "/seas"
    # end
  end


  private
  # In controller actions, use this private method to access sea params from forms.
  # Example: @sea.update(sea_params)
  # check the return value of sea_params to see what you're working with!
  def sea_params
    params.require(:sea).permit(:name, :temperature, :bio, :mood, :image_url, :favorite_color, :scariest_creature, :has_mermaids)
  end

  def set_sea
    @sea = Sea.find(params[:id])
  end

end
