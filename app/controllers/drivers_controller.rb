class DriversController < ApplicationController
  before_action :set_driver, only: [:show, :edit, :update, :destroy, :assign_task, :update_token]
  before_action :set_driver_using_token, only: [:update_coordinates, :tasks, :mark_task_as_done]

  def index
    @drivers = Driver.all
  end

  def show
  end

  def new
    @driver = Driver.new
  end

  def edit
  end

  def create
    @driver = Driver.new(driver_params)

    respond_to do |format|
      if @driver.save
        format.html { redirect_to @driver, notice: 'Driver was successfully created.' }
        format.json { render :show, status: :created, location: @driver }
      else
        format.html { render :new }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @driver.update(driver_params)
        format.html { redirect_to @driver, notice: 'Driver was successfully updated.' }
        format.json { render :show, status: :ok, location: @driver }
      else
        format.html { render :edit }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @driver.destroy
    respond_to do |format|
      format.html { redirect_to drivers_url, notice: 'Driver was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def assign_task
    @delivery = Delivery.find_by(id: params[:task_id])
    @driver.deliveries += [@delivery]
    render json: ::DetailsForDashSerializer.new(@delivery.company_id, @delivery.city_id), status: 200
  end

  def mark_task_as_done
    @delivery = @driver.deliveries.where(id: params[:task_id]).first
    @delivery.update(status: 2)
    render json: { message: true }, status: 200
  end

  def update_coordinates
    lat = params[:latitude]
    long = params[:longitude]
    Pusher.trigger('location', 'update', { driver: @driver.name, location: { latitude: lat, longitude: long } })
    render json: { message: true }
  end

  def register_token
    token = Random.rand(100000...999999)
    puts token
    render json: { token: token }
  end

  def tasks
    render json: ::DriverSerializer.new(@driver, root: false), status: 200
  end

  def update_token
    @driver.token = params[:token]

    if @driver.save
      render json: { message: true }, status: 200
    else
      render nothing: true, status: 400
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver
      id = params[:driver_id] || params[:id]
      @driver = Driver.find_by(id: id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def driver_params
      params.require(:driver).permit(:name, :age, :city_id, :company_id)
    end

    def set_driver_using_token
      @driver = Driver.find_by(token: params[:driver_token].to_i)

      unless @driver
        render nothing: true, status: 404
      end
    end
end
