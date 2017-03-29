class homesController < ApplicationController
  before_action :set_home, only: [:show, :edit, :update]
  # This means that the set_home function will run before the show, edit, and update methods below
  before_action :authenticate_user!, except: [:show]
  # You don't need to be signed in for the show function (you want all users to see your listings)

  def index
    @homes = current_user.homes
    # the 'homes' on line above(line 3) is plural because one user can have many homes, according to how we set up our db
  end

  def show

  end

  def new
    @home = current_user.homes.build
  end

  def create
    @home = current_user.homes.build(home_params)

    if @home.save
      redirect_to @home, notice: "Saved!"
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @home.update(room_params)
      redirect_to @home, notice: "Updated!"
    else
      render :edit
    end
  end

  private
    def set_home
      @home = home.find(params[:id])
    end

    def home_params
      params.require(:home).permit(:home_type, :bed_room, :bath_room, :listing_name, :summary, :address, :is_furnished, :is_ready, :price)
end
