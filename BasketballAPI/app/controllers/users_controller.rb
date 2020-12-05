class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :games]

  def index
    @users = User.alphabetical_name
    render json: UsersSerializer.new(@users).serialized_json
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: UserSerializer.new(@user).serialized_json
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: UserSerializer.new(@user).serialized_json
  end

  def update
    if @user.update(user_params)
      render json: UserSerializer.new(@user).serialized_json
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def games
    @games = @user.games
    render json: GamesSerializer.new(@games).serialized_json
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:firstname, :lastname, :email, :username, :dob, :phone, :password, :password_confirmation)
  end
end
