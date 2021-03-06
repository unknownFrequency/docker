class GalleryImagesController < ApplicationController
  before_action :set_gallery_image, only: [:show, :edit, :update, :destroy]
  #before_action :image_size_validation, only: [:create, :update]

  private
  def image_size_validation
    errors[:image] << "Billedet skal fylde mindre end 500KB" if @gallery_image.size > 0.5.megabytes
  end

  # GET /gallery_images
  def index
    @gallery_images = GalleryImage.all
  end

  # GET /gallery_images/1
  def show
  end

  # GET /gallery_images/new
  def new
    @gallery_image = GalleryImage.new
  end

  # GET /gallery_images/1/edit
  def edit
  end

  # POST /gallery_images
  def create
    @gallery_image = GalleryImage.new(gallery_image_params)
    if image_size_validation
      unless @gallery_image.save
        render :new
      end
    end
  end

  # PATCH/PUT /gallery_images/1
  def update
    if @gallery_image.update(gallery_image_params)
      redirect_to gallery_path(@gallery_image.gallery_id), notice: 'Gallery billedet blev opdateret.'
    else
      render :edit
    end
  end

  # DELETE /gallery_images/1
  def destroy
    @gallery_image.destroy
    redirect_to gallery_images_url, notice: 'Gallery image was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery_image
      @gallery_image = GalleryImage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gallery_image_params
      params.require(:gallery_image).permit(:gallery_id, :image)
    end
end
