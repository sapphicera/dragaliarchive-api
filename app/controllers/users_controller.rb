class UsersController < ApplicationController
  def index
    @users = User.all
    render template: "users/index"
  end

  def show
    @user = User.find_by(id: params[:id])
    render template: "users/show"
  end

  def create
    @user = User.new(
      username: params[:username],
      password: params[:password],
      email: params[:email],
      icon: params[:icon],
      ign: params[:ign],
      alliance_id: params[:alliance_id],
      level: params[:level],
      gameid: params[:gameid],
      description: params[:description],
      weapon: params[:weapon],
      element: params[:element],
      event: params[:event],
      fight: params[:fight]
    )

    if @user.save
      render template: "users/show"
    else
      render json: {errors: @user.errors.full_messages}, status: 422
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    
    @user.username = params[:username] || @user.username
    @user.password = params[:password] || @user.password
    @user.email = params[:email] || @user.email
    @user.icon = params[:icon] || @user.icon
    @user.ign = params[:ign] || @user.ign
    @user.alliance_id = params[:alliance_id] || @user.alliance_id
    @user.level = params[:level] || @user.level
    @user.gameid = params[:gameid] || @user.gameid
    @user.description = params[:description] || @user.description
    @user.weapon = params[:weapon] || @user.weapon
    @user.element = params[:element] || @user.element
    @user.event = params[:event] || @user.event
    @user.fight = params[:fight] || @user.fight

    if @user.save
      render template: "users/show"
    else
      render json: {errors: @user.errors.full_messages}, status: 422
    end
  end

  def destroy
    user = User.find_by(id: params[:id])

    if User.exists?(params[:id])
      user.destroy
      message = "user deleted"
    else
      message = "user does not exist"
    end

    render json: {message: message}
  end
end