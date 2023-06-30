class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /bookings
  def index
    @bookings = current_user.bookings
  end

  def show
    @cat = Cat.find(params[:cat_id])
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  # GET /bookings/new
  def new
    @cat = Cat.find(params[:cat_id])
    @booking = Booking.new(cat: @cat)
    authorize @cat
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @cat = Cat.find(params[:cat_id])
    @booking.cat = @cat
    authorize @booking
    if @booking.save
      redirect_to cat_booking_path(@cat, @booking), notice: 'Booking was successfully created.'
    else
      render :new
    end

  end

  def edit
    @booking = Booking.find(params[:id])
    @cat = Cat.find(params[:cat_id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    @cat = Cat.find(params[:cat_id])
    authorize @booking

    if @booking.update(booking_params)
      redirect_to cats_dashboard_path, notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @cat = @booking.cat
    authorize @booking

    if @booking.destroy
      redirect_to cats_dashboard_path, notice: 'Booking was successfully deleted.'
    else
      redirect_to cats_dashboard_path, alert: 'Failed to delete booking.'
    end
  end


  private

  def set_booking
    @booking = current_user.bookings.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :cat_id)
  end
end
