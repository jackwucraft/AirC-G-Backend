class Api::V1::ProductsController < Api::V1::BaseController
  def index
    render json: { products: Product.all }
    ## PUT http://localhost:3000//api/v1/products
  end

  def show
    render json: { product: Product.find(params[:id]) }
    ## PUT http://localhost:3000//api/v1/products/${id}
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: { product: @product }, status: :created
    else
      render_error
    end
    ## POST http://localhost:3000//api/v1/products
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      render json: { product: @product }, status: :created
    else
      render_error
    end
    ## PUT http://localhost:3000//api/v1/products/${id}
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :platform, :price_per_day, :user)
  end
end

# need booking and like_list controller
