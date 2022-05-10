class AlliancesController < ApplicationController
  def index
    @alliances = Alliance.all.order(:id)
    render template: "alliances/index"
  end

  def show
    @alliance = Alliance.find_by(name: params[:name])
    render template: "alliances/show"
  end

  def create
    @alliance = Alliance.new(
      name: params[:name],
      icon: params[:icon],
      description: params[:description],
      owner_id: current_user.id
    )

    if @alliance.save
      current_user.update!(:alliance_id => @alliance.id)
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

    if User.find_by(username: params[:username]).present?
      @alliance.owner_id = User.find_by(username: params[:username]).id || @alliance.owner_id
    end

    if @alliance.save
      render template: "alliances/show"
    else
      render json: {errors: @alliance.errors.full_messages}, status: 422
    end
  end

  def destroy
    @alliance = Alliance.find_by(name: params[:name])

    if current_user.update!(:alliance_id => nil)
      @alliance.destroy
    end

    render json: {message: "alliance deleted"}
  end

  def join_alliance
    @alliance = Alliance.find_by(name: params[:name])
    if current_user.update!(:alliance_id => @alliance.id)
      render json: @alliance.as_json
    else
      render json: {errors: @alliance.errors.full_messages}, status: 422
    end
  end

  def leave_alliance
    @alliance = Alliance.find_by(name: params[:name])
    if current_user.update!(:alliance_id => nil)
      render json: @alliance.as_json
    else
      render json: {errors: @alliance.errors.full_messages}, status: 422
    end
  end

  def kick_user
    @alliance = Alliance.find_by(name: params[:name])
    kicked_username = User.find_by(username: params[:username])

    if kicked_username.update!(:alliance_id => nil)
      render json: @alliance.as_json
    else
      render json: {errors: @alliance.errors.full_messages}, status: 422
    end
  end

end
