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
    @gallery = Gallery.new
    @gallery_images = @gallery.gallery_images.build
  end

  # GET /galleries/1/edit
  def edit
  end

  # POST /galleries
  def create
    @gallery = Gallery.new(gallery_params)

    if @gallery.save
      params[:gallery_images][:image].each do |img|
        @gallery_images = @gallery.gallery_images.create!(image: img)
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
