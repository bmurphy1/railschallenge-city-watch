class RespondersController < ApplicationController
  before_action :page_not_found, only: [:new, :edit, :destroy]

  def index
    @responders = Responder.all

    render "index.json"
  end

  def show
    @responder = Responder.where("name == ?", params[:name]).first

    if @responder
      render "show.json", status: 200
    else
      render nothing: true, status: 404
    end
  end

  def create
    @responder = Responder.new(responder_params)

    if @responder.save
      render "show.json", status: :created
    else
      render "errors.json", status: :unprocessable_entity
    end
  end

  def update
    @responder = Responder.where("name = ?", params[:name]).first

    if @responder.update_attributes(update_responder_params)
      render "show.json"
    else
      render "errors.json", status: :unprocessable_entity
    end
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

  def update_responder_params
    params.require(:responder).permit([:type, :on_duty])

  end

  def page_not_found
    render json: { message: 'page not found' } , status: 404
  end
end
