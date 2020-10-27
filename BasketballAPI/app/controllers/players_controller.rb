class PlayersController < ApplicationController

  before_action :set_player, only: [:show, :update, :destroy]

  def index
    @players = Player.all
    render json: PlayerSerializer.new(@players).serialized_json
  end

  def show
    render json: PlayerSerializer.new(@player).serialized_json
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      render json: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  def update
    if @player.update_attributes(player_params)
      render json: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @player.destroy
    if !@player.destroyed?
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  private
  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.permit(:user_id, :game_id, :status)
  end

end