class Api::V1::GamesController < ApplicationController
  def index
    render json: { games: Game.all }
  end

  def show
    render json: { game: Game.find(params[:id]) }
  end
end
