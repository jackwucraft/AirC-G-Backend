class Api::V1::GamesController < ApplicationController
  def index
    render json: { games: Game.all }
  end

  def show
    render json: { game: Game.find(params[:id]) }
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      render json: { game: @game }, status: :created
    else
      render_error
    end
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      render json: { game: @game }, status: :created
    else
      render_error
    end
  end

  private

  def game_params
    params.require(:game).permit(:name, :description, :platform, :price_per_day)
  end
end
