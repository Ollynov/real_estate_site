class HomesController < ApplicationController
  before_action :set_home, only: [:show, :edit, :update]
  # This means that the set_home function will run before the show, edit, and update methods below
  before_action :authenticate_user!, except: [:show]
  # You don't need to be signed in for the show function (you want all users to see your listings)

  def index
    @homes = current_user.homes
    # the 'homes' on line above(line 3) is plural because one user can have many homes, according to how we set up our db
  end

  def show
    @photos = @home.photos
    @home = Home.find(params[:id])
  end

  def new
    @home = current_user.homes.build
  end

  def create
    @home = current_user.homes.build(home_params)

    if @home.save

      if params[:images]
        params[:images].each do |image|
          @home.photos.create(image: image)
        end
      end

      @photos = @home.photos
      redirect_to edit_home_path(@home), notice: "Saved!"
    else
      render :new
    end
  end

  def edit
    # This conditional here is so that only you can edit your own photos
    if current_user.id == @homes.user.id
      @photo = @home.photos
    else
      redirect_to root_path, notice: "No permission"
    end
  end

  def update
    if @home.update(room_params)

      if params[:images]
        params[:images].each do |image|
          @home.photos.create(image: image)
        end
      end

      redirect_to edit_home_path(@home), notice: "Updated!"

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
end
