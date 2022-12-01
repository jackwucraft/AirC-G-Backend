class Api::V1::GamesController < Api::V1::BaseController
  def index
    render json: { games: Game.all }
    ## PUT http://localhost:3000//api/v1/games
  end

  def show
    render json: { game: Game.find(params[:id]) }
    ## PUT http://localhost:3000//api/v1/games/${id}
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      render json: { game: @game }, status: :created
    else
      render_error
    end
    ## POST http://localhost:3000//api/v1/games
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      render json: { game: @game }, status: :created
    else
      render_error
    end
    ## PUT http://localhost:3000//api/v1/games/${id}
  end

  private

  def game_params
    params.require(:game).permit(:name, :description, :platform, :price_per_day, :user)
  end
end

# need booking and like_list controller
