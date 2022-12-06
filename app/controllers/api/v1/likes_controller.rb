class Api::V1::LikesController < ApplicationController
  def show
    @likelist = Like.all.select { |like| like.user == User.find(params[:user_id]) }
    @productlist = @likelist.map(&:product)
    render json: { products: @productlist }
  end
  ## GET http://localhost:3000/api/v1/users/<PUT USER ID HERE>/likes

  def create_or_destroy
    @new_like = Like.new
    @product = Product.find(params[:product_id])
    @new_like.product = @product
    user_id = params[:user_id]
    if User.find(user_id).likes.map(&:product).include?(@product)
      User.find(user_id).likes.each { |like| like.destroy if like.product == @product }
    else
      @new_like.user = User.find(user_id)
      @new_like.save
    end
    render json: { products: User.find(user_id).likes.map(&:product) }
  end

  ## POST http://localhost:3000/api/v1/games/<PUT GAME ID HERE>/likes
  ## DATA post should like this: { user_id: <PUT USER ID HERE> }
  ## if you send an existed id, it will destroy the like
  ## if you send an non-existed id, it will create a like
end
