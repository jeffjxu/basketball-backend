class FavoritesController < ApplicationController

  before_action :set_favorite, only: [:show, :destroy]

  def index
    @favorites = Favorite.all
    render json: FavoriteSerializer.new(@favorites).serialized_json
  end

  def show
    render json: FavoriteSerializer.new(@favorite).serialized_json
  end

  def create
    @favorite = Favorite.new(favorite_params)
    if @favorite.save
      render json: FavoriteSerializer.new(@favorite).serialized_json
    else
      render json: @favorite.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @favorite.destroy
    if !@favorite.destroyed?
      render json: @favorite.errors, status: :unprocessable_entity
    else
      render json: FavoriteSerializer.new(@favorite).serialized_json
    end
  end

  private
  def set_favorite
    @favorite = Favorite.find(params[:id])
  end

  def favorite_params
    params.permit(:favoriter_id, :favoritee_id)
  end

end