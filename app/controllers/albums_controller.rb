class AlbumsController < ApplicationController
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
end
