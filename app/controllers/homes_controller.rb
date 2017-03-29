class homesController < ApplicationController
  before_action :set_home, only: [:show, :edit, :update]
  # This means that the set_home function will run before the show, edit, and update methods below

  def index
    @homes = current_user.homes
    # the 'homes' on line above(line 3) is plural because one user can have many homes, according to how we set up our db
  end

  def show

  end

  def new
  end

  def create
  end

  def edit

  end

  def update

  end

  private
    def set_home
      @home = home.find(params[:id])
    end

    def home_params
      params.require(:home).permit(:home_type, :bed_room, :bath_room, :listing_name, :summary, :address, :is_furnished, :is_ready)
end
