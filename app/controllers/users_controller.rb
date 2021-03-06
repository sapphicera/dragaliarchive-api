class UsersController < ApplicationController
  def index
    # @users = User.all.order(:id)

    if params[:search_term]
      @users = User.where("username LIKE ?", "%#{params[:search_term]}%").order(:id)
    end

    render template: "users/index"
  end

  def show
    @user = User.find_by(username: params[:username])
    render template: "users/show"
  end

  def create
    @user = User.new(
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if @user.save
      render template: "users/show"
    else
      render json: {errors: @user.errors.full_messages}, status: 422
    end
  end

  def update
    @user = User.find_by(username: params[:username])
    
    # @user.username = params[:username] || @user.username
    # @user.password = params[:password] || @user.password
    # @user.email = params[:email] || @user.email
    @user.icon = params[:icon] || @user.icon
    @user.ign = params[:ign] || @user.ign
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