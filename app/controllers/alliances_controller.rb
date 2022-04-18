class AlliancesController < ApplicationController
  def index
    @alliances = Alliance.all
    render template: "alliances/index"
  end

  def show
    @alliance = Alliance.find_by(id: params[:id])
    render template: "alliances/show"
  end

  def create
    @alliance = Alliance.new(
      name: params[:name],
      icon: params[:icon],
      description: params[:description],
      owner_id: params[:owner_id]
    )

    if @alliance.save
      render template: "alliances/show"
    else
      render json: {errors: @alliance.errors.full_messages}, status: 422
    end
  end

  def update
    @alliance = Alliance.find_by(id: params[:id])
    @alliance.name = params[:name] || @alliance.name
    @alliance.icon = params[:icon] || @alliance.icon
    @alliance.description = params[:description] || @alliance.description
    @alliance.owner_id = params[:owner_id] || @alliance.owner_id

    if @alliance.save
      render template: "alliances/show"
    else
      render json: {errors: @alliance.errors.full_messages}, status: 422
    end
  end

  def destroy
    alliance = Alliance.find_by(id: params[:id])

    if Alliance.exists?(params[:id])
      alliance.destroy
      message = "alliance deleted"
    else
      message = "alliance does not exist"
    end

    render json: {message: message}
  end
end
