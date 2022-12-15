class Api::V1::ProductsController < Api::V1::BaseController
  def index
    render json: { products: Product.all }
    ## GET http://localhost:3000/api/v1/products
  end

  def show
    render json: { product: Product.find(params[:id]), user: Product.find(params[:id]).user}
    ## GET http://localhost:3000/api/v1/products/${id}
  end

  def create
    @product = Product.new(product_params)
    @product.user = User.find(product_params[:user_id])
    # @product.sort = "game"
    if @product.save
      render json: { product: @product }, status: :created
    else
      render_error
    end
    ## POST http://localhost:3000/api/v1/products
  end

  def update
    @product = Product.find(params[:id])
    # @product.sort = "game"
    if @product.update(product_params)
      render json: { product: @product }, status: :created
    else
      render_error
    end
    ## PUT http://localhost:3000/api/v1/products/${id}
  end

  def destroy
    id = params[:id]
    Product.find(id).destroy
    if Product.find(id).nil?
      render json: { message: "success" }
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :platform, :picture_url, :user_id)
  end
end

# need booking and like_list controller
