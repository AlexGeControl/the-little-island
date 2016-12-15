class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]
  
  def index
    @rooms = current_user.rooms
  end

  def show
    @photos = @room.photos
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)
    
    if @room.save
      if params[:images]
        params[:images].each do |image|
          @room.photos.create(image: image)
        end
      end
      
      @photos = @room.photos
      redirect_to edit_room_path(@room), notice: "创建成功!"
    else
      render :new
    end
  end

  def edit
    if current_user.id == @room.user.id
      @photos = @room.photos
    else
      redirect_to root_path, notice: "权限不足, 无法修改"
    end
  end

  def update
    if @room.update(room_params)
      if params[:images]
        params[:images].each do |image|
          @room.photos.create(image: image)
        end
      end
      
      redirect_to edit_room_path(@room), notice: "修改成功!"
    else
      render :edit
    end
  end

  private
    def set_room
      @room = Room.find(params[:id])
    end
    
    def room_params
      params.require(:room).permit(
        :home_type, 
        :room_type, 
        :address,
        :accommodate, 
        :bed_room, 
        :bath_room, 
        :is_tv, 
        :is_wifi, 
        :is_air, 
        :is_heating, 
        :is_kitchen, 
        :is_bbq, 
        :listing_name, 
        :summary, 
        :price, 
        :active
      )
    end
end
