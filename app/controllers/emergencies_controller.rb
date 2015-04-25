class EmergenciesController < ApplicationController
  before_action :set_emergency, only: [:show, :update]
  before_action :page_not_found, only: [:new, :edit, :destroy]

  def index
    @emergencies = Emergency.all

    render "index.json"
  end

  def show
    render json: @emergency
  end

  def create
    @emergency = Emergency.new(emergency_params)

    if @emergency.save
      render "show.json", status: :created
    else
      render "errors.json", status: :unprocessable_entity
    end
  end

  def new
  end

  def edit
  end

  def destroy
  end

  private

  def set_emergency
    @emergency = Emergency.find(emergency_params[:code])
  end

  def emergency_params
    params.require(:emergency).permit([:code, :fire_severity, :police_severity, :medical_severity])
  end

  def page_not_found
    render json: { message: 'page not found' } , status: 404
  end
end
