class DogsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

  # GET /dogs
  # GET /dogs.json
  def index
    if current_user
      @user = current_user 
      if current_user.dogs.any? 
      @breed = @user.dogs.first.primarybreed
      # params[:search] = @breed
      end
      @dog = Dog.search(params[:search],current_user.id).sample if params[:search].present?
      # @userburrough = Geocoder.search("#{@user.latitude}, #{@user.longitude}")[0].data["address_components"][3]["long_name"]
      # @userhood = Geocoder.search("#{@user.latitude}, #{@user.longitude}")[0].data["address_components"][2]["long_name"]

        #so
      #@dog = Dog.search(params[:search]) if params[:search].present?
    end
  end

  # GET /dogs/1
  # GET /dogs/1.json
  def show
        @dog = Dog.find(params[:id])
  end
  # GET /dogs/new
  def new
    @dog = Dog.new
  end

  # GET /dogs/1/edit
  def edit
      @dog = Dog.find(params[:id])

  end

  # POST /dogs
  # POST /dogs.json
  def create
    @dog = current_user.dogs.build(dog_params)
      if @dog.save
        flash[:success] = "Dog Created! Good Work!"
        redirect_to current_user
      else
        render 'static_pages/home'
      end
  end

  # PATCH/PUT /dogs/1
  # PATCH/PUT /dogs/1.json
  def update
    @dog = Dog.find(params[:id])
    respond_to do |format|
      if @dog.update(dog_params)
        format.html { redirect_to @dog, notice: 'Dog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dogs/1
  # DELETE /dogs/1.json
  def destroy
    Dog.find(params[:id]).destroy
    redirect_to current_user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog
      @dog = Dog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dog_params
      params.require(:dog).permit(:name, :nick, :primarybreed, :secondarybreed, :neighborhood, :age, :weight, :image)
    end
end
