class CatsController < ApplicationController
  before_action :set_cat, only: [:show, :edit, :update, :destroy]
  skip_after_action :verify_authorized, only: :dashboard
  after_action :verify_policy_scoped, only: :dashboard

  # Passing cats information to array then turn each instance into a geocoded hash(i.e an object)
  def index
  end

  #list all the cats
  def dashboard
    @cats = policy_scope(Cat)
    @bookings = current_user.bookings.includes(:cat)
  end

  #list one cat = id
  def show
    authorize @cat
  end

  #to show the form = jump to the new.html.erb
  def new
    @cat = Cat.new
    authorize @cat
  end

  #save function
  def create
    @cat = Cat.new(cat_params)
    @cat.user = current_user
    authorize @cat
    if @cat.save
      redirect_to cat_path(@cat) #redirect back to #show aka cat id
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    authorize @cat
  end

  def update
    @cat.update(cat_params)
    redirect_to cat_path(@cat)
  end

  def destroy
    authorize @cat
    cat.destroy
    redirect_to cat_path, status: :see_other
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :gender, :age, :breed, :microchip_number, :photo_url, :address, :color, :temperament, :description, photos: [])
  end

  def set_cat
    @cat = Cat.find(params[:id])
    authorize @cat
  end
end


# ->home ->sign in -> dashboard with all the cats
# -> add a new cat


# -> choose to see one cat - show cat_id
#  --> #edit/update a cat
#  --> delete a cat
