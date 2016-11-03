class InquiriesController < ApplicationController
  before_action :set_inquiry, only: [:show, :edit, :update, :destroy]

  # GET /inquiries
  def index
    @inquiries = Inquiry.all
  end

  # GET /inquiries/1
  def show
  end

  # GET /inquiries/new
  def new
    @inquiry = Inquiry.new
  end

  # GET /inquiries/1/edit
  def edit
  end

  # POST /inquiries
  def create
    @inquiry = Inquiry.new(inquiry_params)

    if @inquiry.save
      redirect_to @inquiry, notice: 'Inquiry was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /inquiries/1
  def update
    if @inquiry.update(inquiry_params)
      redirect_to @inquiry, notice: 'Inquiry was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /inquiries/1
  def destroy
    @inquiry.destroy
    redirect_to inquiries_url, notice: 'Inquiry was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inquiry
      @inquiry = Inquiry.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def inquiry_params
      params.require(:inquiry).permit(:type, :user_id, :fly_date, :longitude, :aptitide)
    end
end
