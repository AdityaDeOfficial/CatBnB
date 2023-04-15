class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /bookings
  def index
    @bookings = current_user.bookings
  end

  def show
    set_booking
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
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: 'Booking was successfully destroyed.'
  end

  private

  def set_booking
    @booking = current_user.bookings.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :cat_id)
  end
end
