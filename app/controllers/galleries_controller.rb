class GalleriesController < ApplicationController
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]

  # GET /galleries
  def index
    @galleries = Gallery.all
  end

  # GET /galleries/1
  def show
    @gallery_images = @gallery.gallery_images.all
  end

  # GET /galleries/new
  def new
    render component: 'ImageForm', tag: 'div'
    @gallery = Gallery.new
    @gallery_images = @gallery.gallery_images.build
  end

  # GET /galleries/1/edit
  def edit
  end

  # POST /galleries
  def create
    @gallery = Gallery.new(gallery_params)
    #images = { images: {} }
      #params[:gallery_images][:image].each do |img|
        #images[:images] = img
      #end
    #end
    if @gallery.save
      @gallery_images = @gallery.gallery_images.build
      if params[:gallery_images][:image].count > 1 
        params[:gallery_images][:image].each do |image|
          @gallery_images = @gallery.gallery_images.new(image: image)
          @gallery_images.save() #validate: false
        end
      end
      redirect_to @gallery, notice: 'Gallery was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /galleries/1
  def update
    if @gallery.update(gallery_params)
      redirect_to @gallery, notice: 'Gallery was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /galleries/1
  def destroy
    @gallery.destroy
    redirect_to galleries_url, notice: 'Gallery was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gallery_params
      params.require(:gallery).permit(:name, :description, gallery_images_attributes: [:id, :gallery_id, :image])
    end
end
