class RespondersController < ApplicationController
  before_action :page_not_found, only: [:new, :edit, :destroy]

  def index
    @responders = Responder.all

    if @responders
      render json: {responders: []}
    else
      render json: @responders

  def show
    @responders = Responder.where("name == ?", params[:name])

    if @responders.empty?
      render nothing: true, status: 404
    else
      render json: { "responder" => @responders.first }, status: 200
    end
  end

  def create
    @responder = Responder.new(responder_params)

    if @responder.save
      render json: @responder, status: :created
    else
      render json: { message: @responder.errors }, status: :unprocessable_entity
    end
  end

  def update
  end

  #Unused routes - new, edit, destroy
  def new
  end

  def edit
  end

  def destroy
  end

  private

  def responder_params
    params.require(:responder).permit([:name, :type, :capacity])
  end

  def page_not_found
    render json: { message: 'page not found' } , status: 404
  end
end
