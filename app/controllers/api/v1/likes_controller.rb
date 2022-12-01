class Api::V1::LikesController < ApplicationController
  def show
    @likelist = Like.all.select { |like| like.user == User.find(params[:user_id]) }
    @gamelist = @likelist.map(&:game)
    render json: { games: @gamelist }
  end
  ## PUT http://localhost:3000/api/v1/users/<PUT USER ID HERE>/likelist

  def create_or_destroy
    @new_like = Like.new
    @game = Game.find(params[:game_id])
    @new_like.game = @game
    user_id = params[:user_id]
    if User.find(user_id).likes.map(&:game).include?(@game)
      User.find(user_id).likes.each { |like| like.destroy if like.game == @game }
    else
      @new_like.user = User.find(user_id)
      @new_like.save
    end
    render json: { games: User.find(user_id).likes.map(&:game) }
  end

  ## POST http://localhost:3000/api/v1/games/<PUT GAME ID HERE>/likes
  ## DATA post should like this: { user_id: <PUT USER ID HERE> }
  ## if you send an existed id, it will destroy the like
  ## if you send an non-existed id, it will create a like
end
