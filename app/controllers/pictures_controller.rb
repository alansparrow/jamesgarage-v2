class PicturesController < ApplicationController
  before_filter :signed_in_admin, only: [:new, :destroy, :create, :update_cover]

  def show
    @picture = Picture.find(params[:id])
    send_data @picture.data, :filename => @picture.filename, :type => @picture.content_type
  end

  def create
    @album = Album.find(params[:album_id])
    num_of_pic = @album.pictures.count

    @attachment = @album.pictures.new
    @attachment.cover_mark = false

    #save to receive id
    @attachment.save
    
    if params[:picture] && params[:picture][:picture]
      # make the first picture the album's cover
      @attachment.cover_mark = true if num_of_pic == 0

      @attachment.uploaded_picture = params[:picture][:picture]
      @attachment.save
      flash[:success] = "File has been uploaded successfully."
    else
      flash[:danger] = "You must select a file to upload."
      @attachment.delete
    end

    redirect_to new_album_picture_path(@album)

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

  def update_cover
    album = Picture.find(params[:id]).album

    # change cover mark's state of this old picture to false
    @old_cover = album.pictures.find_by cover_mark: true
    @old_cover.cover_mark = false
    @old_cover.save

    # set new cover
    @new_cover = album.pictures.find(params[:id])
    @new_cover.cover_mark = true
    @new_cover.save

    redirect_to edit_album_path(@new_cover.album)
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
