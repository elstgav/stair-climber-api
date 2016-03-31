class ClimbsController < ApplicationController
  include DateRange

  before_action :set_climbs, only: [:index]
  before_action :set_climb, only: [:show, :update, :destroy]

  # GET /climbs
  def index
    render json: @climbs
  end

  # GET /climbs/1
  def show
    render json: @climb
  end

  # POST /climbs
  def create
    @climb = Climb.new(climb_params)

    if @climb.save
      render json: @climb, status: :created, location: @climb
    else
      render json: @climb.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /climbs/1
  def update
    @climb = Climb.find(params[:id])

    if @climb.update(climb_params)
      head :no_content
    else
      render json: @climb.errors, status: :unprocessable_entity
    end
  end

  # DELETE /climbs/1
  def destroy
    @climb.destroy

    head :no_content
  end

  private

  def set_climb
    @climb = Climb.find(params[:id])
  end

  def set_climbs
    @climbs ||= begin
      user_id = params[:user_id]
      climbs = user_id.present? ? Climb.user_flights(user_id, date_range) : Climb.all
      climbs.order('datetime DESC')
    end
  end

  def climb_params
    params.require(:climb).permit(:datetime, :flights, :user_id)
  end
end
