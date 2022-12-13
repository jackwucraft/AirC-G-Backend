class Api::V1::ProductsController < Api::V1::BaseController
  def index
    render json: { products: Product.all }
    ## GET http://localhost:3000/api/v1/products
  end

  def show
    render json: { product: Product.find(params[:id]) }
    ## GET http://localhost:3000/api/v1/products/${id}
  end

  def create
    @product = Product.new({ name: product_params.name,
                             description: product_params.description,
                             platform: product_params.platform })
    @product.user = User.find(product_params.user_id)
    if @product.save
      render json: { product: @product }, status: :created
    else
      render_error
    end
    ## POST http://localhost:3000/api/v1/products
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      render json: { product: @product }, status: :created
    else
      render_error
    end
    ## PUT http://localhost:3000/api/v1/products/${id}
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :platform, :user_id)
  end
end

# need booking and like_list controller
