class AlbumsController < ApplicationController
  before_filter :signed_in_admin, only: [:new, :edit, :create, :edit_all, :destroy, :change_title, :update]

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    
    redirect_to album_edit_all_path
  end

  def change_title
    @album = Album.find(params[:id])
  end
  
  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(params[:album])
      flash[:success] = "Album's title updated"
      redirect_to album_edit_all_path
    else
      render 'change_title'
    end
  end

  def edit_all
    @albums = Album.all
  end
  
  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(:title => params[:album][:title])

    if @album.save
      redirect_to new_album_picture_path(@album)
    else
      render 'new'
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  private

  def signed_in_admin
    if !admin?
      store_location
      flash[:danger] = "Please sign in."
      redirect_to signin_path
    end
  end
end
