class PicturesController < ApplicationController
  def show
    @picture = Picture.find(params[:id])
    send_data @picture.data, :filename => @picture.filename, :type => @picture.content_type
  end

  def create
    @album = Album.find(params[:album_id])
    @attachment = @album.pictures.new

    #save to receive id
    @attachment.save

    @attachment.uploaded_picture = params[:picture][:picture]

    @attachment.save

    if @album.save
      redirect_to new_album_picture_path(@album)
    else
      render 'new'
    end
  end

  def new
    @album = Album.find(params[:album_id])
    @picture = @album.pictures.new
  end
  
  def destroy
    @picture = Picture.find(params[:id])    
    album = @picture.album
    @picture.destroy

    redirect_to edit_album_path(album)
  end
  
end
